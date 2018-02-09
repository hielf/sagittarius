class Event < ApplicationRecord
  has_many :goods
  #has_many :user_events
  #has_many :users, through: :user_events
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
