class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :state
  #mount_uploader :image, AvatarUploader

  # validates :photo_type, inclusion: ['tg', 'shelf', 'new', 'project'], presence: true

  # state_machine :status, :initial => :'待审批' do
  #   event :approve do
  #     transition :'待审批' => :'已审批'
  #   end
  #   event :disapprove do
  #     transition :'待审批' => :'否决'
  #   end
  # end

  def trans_wechat_media
    Wechat.api.media [self.media_id, "#{ENV['path_to_root']}/tmp/image"]

    bucket = APP_CONFIG['qiniu_bucket']
    key = nil
    put_policy = Qiniu::Auth::PutPolicy.new(
        bucket, # 存储空间
        key,    # 指定上传的资源名，如果传入 nil，就表示不指定资源名，将使用默认的资源名
        3600    # token 过期时间，默认为 3600 秒，即 1 小时
    )
    filePath = Dir.glob("#{ENV['path_to_root']}/tmp/image/#{self.id}.*").first
    trans = false
    # 生成上传 Token
    uptoken = Qiniu::Auth.generate_uptoken(put_policy)
    # 调用 upload_with_token_2 方法上传
    code, result, response_headers = Qiniu::Storage.upload_with_token_2(
         uptoken,
         filePath,
         key,
         nil, # 可以接受一个 Hash 作为自定义变量，请参照 http://developer.qiniu.com/article/kodo/kodo-developer/up/vars.html#xvar
         bucket: bucket
    ) if filePath

    if code == 200
      true if self.update!(image: result["key"])
    else
      false
    end
  end

end
