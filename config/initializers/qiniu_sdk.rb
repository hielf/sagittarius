require 'qiniu'
Qiniu.establish_connection! access_key: ENV['qiniu_ak'],
                            secret_key: ENV['qiniu_sk']
