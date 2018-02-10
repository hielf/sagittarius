class Api::QiniuController < Api::ApplicationController
  require 'qiniu'
  def token
    Qiniu.establish_connection! access_key: ENV['qiniu_ak'],
                                secret_key: ENV['qiniu_sk']
    bucket = ENV["qiniu_bucket"]
    put_policy = Qiniu::Auth::PutPolicy.new(bucket)
    # 生成上传 Token
    upload_token = Qiniu::Auth.generate_uptoken(put_policy)
    if upload_token
      result = [0, upload_token]
    else
      result = [1, "failed"]
    end
    render_json(result)
  end
end
