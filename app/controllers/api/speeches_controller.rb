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
    result[:frequentWordCount] = MorphologicalAnalysis.
                         where(sentence_id: sentence_ids, pos: "名詞").
                         group("surface").
                         order("COUNT(surface) DESC").
                         limit(5).count
    result[:totalWordCount] = MorphologicalAnalysis.where(sentence_id: sentence_ids, pos: "名詞").count
    score_list = KeyPhrase.where(sentence_id: sentence_ids).group(:keyphrase).average(:score)
    count_list = KeyPhrase.where(sentence_id: sentence_ids).group(:keyphrase).count
    calc_list = score_list.inject({}) do |diff , (key, value)|
      diff[key] = value * count_list[key].to_i
      diff
    end.sort_by{|key, value| -value}
    list = calc_list.transpose
    result[:totalKeyPhraseScore] = list[1].try(:sum)
    result[:highKeyPhraseScore] = Hash[*[list[0][0..4], list[1][0..4]].transpose.flatten]
    return result
  end
end
