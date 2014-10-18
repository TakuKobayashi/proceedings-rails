# coding: utf-8
class SnsConnectionsController < BaseController
  def create
    auth = request.env["omniauth.auth"]
    user = User.where(id: session[:user_id], auth_token: session[:auth_token]).first
    if user.present?
      sns = user.sns_configs
    else
      sns = SnsConfig
    end
    sns = sns.find_or_initialize_by(config_type: (auth.provider + "_config").classify, uid: auth.uid)
    sns.token = auth.credentials.token
    sns.token_secret = auth.credentials.secret
    if sns.user_id.present?
      sns.save!
    else
    end
    redirect_to root_url
  end
end
