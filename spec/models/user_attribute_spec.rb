# == Schema Information
#
# Table name: user_attributes
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  mail_address :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_user_attributes_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe UserAttribute, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
