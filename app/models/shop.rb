class Shop < ApplicationRecord
  belongs_to :area
  has_many :users

  validates :name, presence: true, length: {maximum: 20}, uniqueness: true
end
