class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :event

  state_machine :status, :initial => :'待审批' do
    event :approve do
      transition :'待审批' => :'已审批'
    end
    event :disapprove do
      transition :'待审批' => :'否决'
    end
  end
end
