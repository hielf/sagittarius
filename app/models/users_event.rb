class UsersEvent < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :event, presence: true
  validates :user, presence: true
  validates_uniqueness_of :user_id, :scope => :event_id
end
