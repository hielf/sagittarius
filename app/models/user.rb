class User < ApplicationRecord
  include AccountConcern
  has_secure_password

  validates :username, presence: true, length: {maximum: 10}, on: :create
  validates :username, presence: true, length: {maximum: 12}, uniqueness: true, on: :update
  validates :password, length: {minimum: 6, maximum: 32}, format: {with: /\A[\x21-\x7e]+\Z/i, message: '密码只能包含数字、字母、特殊字符'}, allow_blank: true
  validates :password, presence: true, length: {minimum: 6, maximum: 32}, format: {with: /\A[\x21-\x7e]+\Z/i, message: '密码只能包含数字、字母、特殊字符'}, on: :create
  validates :generate_username_prefix, presence: true, on: :create
  validates :role, inclusion: ['admin', 'staff', 'outworker'], presence: true


  def generate_username_prefix
    username = "n_#{self.username}"
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
