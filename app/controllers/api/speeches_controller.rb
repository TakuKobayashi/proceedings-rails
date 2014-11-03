# coding: utf-8
class Api::SpeechesController < Api::BaseController
  before_filter :load_speech_recognize, only: [:speak, :stop]

  def start
    @speech_recognize = @user.speech_recognizes.create!(status: :active, token: SecureRandom.hex)
  end

  def speak
    @sentence = @speech_recognize.record!(JSON.parse(params[:recognized]) , params[:language_code])
    @sentence.analyze!
    @collected_data = setup_data(@speech_recognize.sentences.pluck(:id))
  end

  def stop
    @speech_recognize.complete!
    head(:ok)
  end

  private
  def load_speech_recognize
    @speech_recognize = @user.speech_recognizes.where(token: params[:token]).first
  end

  def setup_data(sentence_ids)
    result = {}
    #頻出するワード上位5件
    word_counts = MorphologicalAnalysis.
                         where(sentence_id: sentence_ids, pos: "名詞").
                         group("surface").
                         order("COUNT(surface) DESC").
                         limit(5).count
    result[:frequency] = {}
    result[:frequency][:data_list] = word_counts.map{|k, v| {word: k, score: v} }
    result[:frequency][:sum_value] = MorphologicalAnalysis.where(sentence_id: sentence_ids, pos: "名詞").count
    result[:keyphrase] = {}
    score_list = KeyPhrase.where(sentence_id: sentence_ids).group(:keyphrase).average(:score)
    count_list = KeyPhrase.where(sentence_id: sentence_ids).group(:keyphrase).count
    calc_list = score_list.map do |key, value|
      {word: key, score: value * count_list[key].to_i} }
    end.sort_by{|hash| -hash[:score]}
    result[:keyphrase][:data_list] = calc_list
    result[:keyphrase][:sum_value] = calc_list.sum{|h| h[:score].to_f}
    return result
  end
end
