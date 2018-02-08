class User < ApplicationRecord
  include AccountConcern
  has_secure_password

  belongs_to :area
  # belongs_to :team
  # belongs_to :shop

  has_many :events, through: :user_events
  has_many :datums
  has_many :photos

  validates :username, presence: true, length: {maximum: 10}, on: :create
  validates :username, presence: true, length: {maximum: 10}, uniqueness: true, on: :update
  # validates :openid, uniqueness: true, on: :create
  validates :password, presence: true, length: {minimum: 6, maximum: 32}, format: {with: /\A[\x21-\x7e]+\Z/i, message: '密码只能包含数字、字母、特殊字符'}, on: :create
  # validates :generate_username_prefix, presence: true, on: :create
  validates :role, inclusion: ['admin', 'staff', 'outworker'], presence: true


  def generate_username_prefix
    if User.where(username: username).exists?
      errors[:username] << '已存在'
    else
      self.username = username
    end
  end

  def user_role(role)
    case role
      when 'admin'
        '管理员'
      when 'staff'
        '销售员'
      when 'outworker'
        '促销员'
      else
        '未知'
    end
  end

  state_machine :status, :initial => :'待审批' do
    event :approve do
      transition :'待审批' => :'已审批'
    end
  end


private
  def self.open_spreadsheet(file)
    case File.extname(file)
    when ".csv" then Roo::CSV.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{File.basename(file)}"
    end
  end

end
