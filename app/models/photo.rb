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
    # system('RAILS_ENV=production bundle exec wechat media YalsE55UNWce2GjFRei_GVa65y01scGafWP9oTxkv57AJTkvzEB7MEN2uyKVXpGN /tmp/128.jpg')
    tmp_file = Wechat.api.media(self.media_id)
    FileUtils.mv(tmp_file.path, "#{ENV['path_to_root']}/tmp/image/#{self.id}.jpg")
    filePath = Dir.glob("#{ENV['path_to_root']}/tmp/image/#{self.id}.*").first

    bucket = ENV['qiniu_bucket']
    # 生成上传 Token
    # uptoken = Qiniu::Auth.generate_uptoken(put_policy)
    url = "http://127.0.0.1/api/qiniu/token"
    res = HTTParty.get url
    uptoken = JSON.parse(res.body)["message"]
    Rails.logger.warn "qiniu_uptoken: #{uptoken}"
    # 调用 upload_with_token_2 方法上传
    code, result, response_headers = Qiniu::Storage.upload_with_token_2(
         uptoken,
         filePath,
         key,
         nil,
         bucket: bucket
    ) if filePath

    if code == 200
      true if self.update!(image: "http://#{ENV['qiniu_bucket_domain']}/#{result['key']}")
      # "http://#{ENV['qiniu_bucket_domain']}/#{result['key']}"
    else
      false
    end
  end

end
