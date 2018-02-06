class Good < ApplicationRecord
  belongs_to :event
  has_many :datums
end
