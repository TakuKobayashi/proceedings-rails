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

class Sentence < ActiveRecord::Base
  belongs_to :event
  has_many :sentence_candidates
  has_many :dependencies
  has_many :morphological_analysises
  has_many :fixture_sentences
  has_many :key_phrases
end
