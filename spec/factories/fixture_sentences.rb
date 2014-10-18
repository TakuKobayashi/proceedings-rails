# == Schema Information
#
# Table name: fixture_sentences
#
#  id           :integer          not null, primary key
#  sentence_id  :integer          not null
#  start_pos    :integer          not null
#  length       :integer          not null
#  surface      :string(255)      not null
#  shiteki_word :string(255)
#  shiteki_info :string(255)      not null
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_fixture_sentences_on_sentence_id   (sentence_id)
#  index_fixture_sentences_on_shiteki_info  (shiteki_info)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fixture_sentence do
  end
end
