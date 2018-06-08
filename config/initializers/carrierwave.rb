::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = ENV['qiniu_ak']
  config.qiniu_secret_key    = ENV['qiniu_sk']
  config.qiniu_bucket        = ENV['qiniu_bucket']
  config.qiniu_bucket_domain = ENV['qiniu_bucket_domain']
  config.qiniu_bucket_private= false #default is false
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocal      = "http"
end

CarrierWave.configure do |config|
  config.qiniu_styles = { thumb: 'imageView2/1/w/200', large: 'imageView2/1/w/800' }
end
