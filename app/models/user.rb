class User < ApplicationRecord
  include AccountConcern
  has_secure_password

  # belongs_to :area
  # belongs_to :team
  # belongs_to :shop
  has_many :users_events
  has_many :events, through: :users_events
  has_many :datums
  has_many :photos
  has_many :states
  # belongs_to :area

  validates :name, presence: {message: '姓名不可以为空'}, on: :create
  validates :username, presence: true, length: {maximum: 10, message: '员工ID不能超过10位'}, on: :create
  validates :username, uniqueness: {message: '该员工ID已被占用'}, on: :create
  validates :username, presence: true, length: {maximum: 10, message: '员工ID不能超过10位'}, uniqueness: true, on: :update
  # validates :openid, uniqueness: true, on: :create
  validates :password, presence: true, length: {minimum: 6, maximum: 32}, format: {with: /\A[\x21-\x7e]+\Z/i, message: '密码至少6位'}, on: :create
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

  def wechat_notice(user, message, url)
    openid = user.openid
    # openid = "oDQVQ0ejzcBtKnBS_scwA7Dr-_3Y"
    template = YAML.load(File.read('app/views/templates/notice.yml'))
    template['template']['url'].gsub!("*url", "#{url}")
    template['template']['data']['first']['value'].gsub!("*first", "你好，你有一条待审核通知")
    template['template']['data']['keyword1']['value'].gsub!("*keyword1", "#{user.name}")
    template['template']['data']['keyword2']['value'].gsub!("*keyword2", "#{Time.now.strftime('%Y年%m月%d日 %H:%M')}")
    template['template']['data']['keyword3']['value'].gsub!("*keyword3", "#{message}")

    wechat.template_message_send Wechat::Message.to(openid).template(template['template'])
  end

  state_machine :status, :initial => :'待审批' do
    event :approve do
      transition :'待审批' => :'已审批'
    end
    event :disapprove do
      transition :'待审批' => :'审批否决'
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

  # def name
  #   self.username
  # end
end
