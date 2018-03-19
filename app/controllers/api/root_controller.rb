module Api
  class RootController < Api::ApplicationController
    skip_before_action :authenticate_user!

    def route_not_found
      # raise ActiveRecord::RecordNotFound
      render_json([404, 'Request page not found'])
    end

    def home
      render_json([0, 'ok'])
    end

    def wechat_access_token
      c = Wechat::ApiLoader.config(:default)
      token_file = c.access_token.presence
      js_token_file = c.jsapi_ticket.presence
      api = Wechat::Api.new(c.appid, c.secret, token_file, c.timeout, c.skip_verify_ssl, js_token_file)
      api.users
      config_file = Rails.root.join('config/wechat.yml')
      wechat_config = YAML.load(ERB.new(File.read(config_file)).result)
      f = File.read(wechat_config["default"]["access_token"])
      # f = File.read(wechat_config["default"]["jsapi_ticket"])
      data = JSON.parse(f)
      access_token = data["access_token"]
      url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=#{access_token}&type=jsapi"
      res = HTTParty.get url
      jsapi_ticket = JSON.parse(res.body)
      data["ticket"] = jsapi_ticket["ticket"]
      if jsapi_ticket["ticket"]
        timestamp = Time.now.to_i.to_s
        url = params[:url].blank? ? "http://sagittarius.shanghairunyan.com/" : params[:url]
        ticket = jsapi_ticket["ticket"]
        noncestr = (0...16).map { (('a'..'z').to_a + ('A'..'Z').to_a)[rand(58)] }.join
        s = "jsapi_ticket=#{jsapi_ticket["ticket"]}&noncestr=#{noncestr}&timestamp=#{timestamp}&url=#{url}"
        signature = Digest::SHA1.hexdigest s
        data["appId"] = c.appid.to_s
        data["timestamp"] = timestamp
        data["nonceStr"] = noncestr
        data["signature"] = signature
      end
      render json: data
    end

    # def wechat_sign
    #   if jsapi_ticket["ticket"]
    #     timestamp = Time.now.to_i.to_s
    #
    #
    #   end
    # end

  end
end
