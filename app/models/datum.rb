class Datum < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :good

  validates :in_num, presence: {message: '请输入进货数量'}, on: :create
  validates :sell_num, presence: {message: '请输入销售数量'}, on: :create
  validates :storage_num, presence: {message: '请输入库存数量'}, on: :create

  state_machine :status, :initial => :'待审批' do
    event :approve do
      transition :'待审批' => :'已审批'
    end
    event :disapprove do
      transition :'待审批' => :'否决'
    end
  end
end
