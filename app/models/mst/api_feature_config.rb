# == Schema Information
#
# Table name: mst_api_feature_configs
#
#  id                     :integer          not null, primary key
#  mst_api_config_id      :integer          not null
#  request_url            :string(255)      not null
#  request_format         :integer          not null
#  limit_count            :integer
#  limit_request_capacity :integer
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  mst_api_feature_configs_request_index  (mst_api_config_id,request_url) UNIQUE
#

class Mst::ApiFeatureConfig < ActiveRecord::Base
  belongs_to :mst_api_config
  has_many   :api_use_logs
end
