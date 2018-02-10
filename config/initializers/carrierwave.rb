::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = "93vlzlK9UlO6UhZaVlrZ4RyVanIv5f1meAX_ofK2"
  config.qiniu_secret_key    = "7UGe9arh_jrxTQGa1WLba3D8xDZ-FbXOJSVYAJt7"
  config.qiniu_bucket        = "sagittarius"
  config.qiniu_bucket_domain = "p3tj4myt5.bkt.clouddn.com"
  config.qiniu_bucket_private= false #default is false
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocal      = "http"
end

CarrierWave.configure do |config|
  config.qiniu_styles = { thumb: 'imageView2/1/w/200', large: 'imageView2/1/w/800' }
end
