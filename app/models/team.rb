class Team < ApplicationRecord
  belongs_to :area
  has_many :users

  validates :generate_code, presence: true, on: :create
  validates :name, presence: true, length: {maximum: 12}, uniqueness: true

  def generate_code
    code = randam_code
    loop do
      n = Team.find_by(code: code)
      break if n.nil?
      code = randam_code
    end
    self.code = code
  end

  private
  def randam_code
    code = rand(1000..9999).to_s
  end
end
