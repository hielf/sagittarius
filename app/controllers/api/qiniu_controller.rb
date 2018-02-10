class Api::QiniuController < Api::ApplicationController
  require 'qiniu'
  def token
    Qiniu.establish_connection! access_key: ENV['qiniu_key'],
                                secret_key: ENV['qiniu_secret']
    bucket = ENV["qiniu_bucket"]
    put_policy = Qiniu::Auth::PutPolicy.new(bucket)
    # 生成上传 Token
    upload_token = Qiniu::Auth.generate_uptoken(put_policy)
    result = [0, upload_token]
    render_json(result)
  end
end
