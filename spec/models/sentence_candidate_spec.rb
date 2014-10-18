# == Schema Information
#
# Table name: sentence_candidates
#
#  id          :integer          not null, primary key
#  sentence_id :integer          not null
#  candidate   :text
#  confidence  :float(24)        default(0.0), not null
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_sentence_candidates_on_sentence_id_and_confidence  (sentence_id,confidence)
#

require 'rails_helper'

RSpec.describe SentenceCandidate, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
