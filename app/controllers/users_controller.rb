class UsersController < ApplicationController
  wechat_api

  def create
    # m_requires! [:username, :mobile, :password]
    ## optional! :role,:name
    Rails.logger.warn  "wechat_oauth2 start"
    Rails.logger.warn  "wechat_oauth2 #{wechat_oauth2}"
    Rails.logger.warn  "wechat_oauth2 snsapi_userinfo #{wechat_oauth2('snsapi_userinfo')}"
    wechat_oauth2('snsapi_userinfo') do |openid, access_info|
      wechat_hash = Wechat.api.web_userinfo( access_info[:access_token], openid)
      logger.info("***********wechat_hash: #{wechat_hash}**************")
    end
  end
end
