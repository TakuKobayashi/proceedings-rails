# == Schema Information
#
# Table name: sentences
#
#  id               :integer          not null, primary key
#  event_id         :integer          not null
#  origin_sentence  :text
#  fixture_sentence :text
#  status           :integer          not null
#  language_code    :string(255)      not null
#  created_at       :datetime
#  updated_at       :datetime
#
# Indexes
#
#  index_sentences_on_event_id  (event_id)
#  index_sentences_on_status    (status)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sentence do
  end
end
