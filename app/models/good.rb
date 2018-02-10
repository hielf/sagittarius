class Good < ApplicationRecord
  belongs_to :event
  has_many :datums

  mount_uploader :image, AvatarUploader
end
