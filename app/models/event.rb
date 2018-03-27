class Event < ApplicationRecord
  has_many :goods
  # belongs_to :user
  has_many :states
  has_many :users_events
  has_many :users, through: :users_events
  mount_uploader :image, AvatarUploader

  state_machine :status, :initial => :'未开始' do
    event :begin do
      transition :'未开始' => :'已开始'
    end
    event :end do
      transition :'已开始' => :'结束'
    end
  end
end
