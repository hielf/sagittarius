ActiveAdmin.register Datum do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :user_id, :event_id, :good_id, :in_num,
  :sell_num, :budget_num, :storage_num, :status
filter :user
filter :event
filter :good
filter :status, as: :select, collection: [['待审批','待审批'],['已审批','已审批'],['否决','否决']]

form do |f|
 f.semantic_errors # shows errors on :base
 f.inputs do
   f.input :user
   f.input :event
   f.input :good
   f.input :in_num
   f.input :sell_num
   f.input :budget_num
   f.input :storage_num
   f.input :status, as: :select, collection: [['待审批','待审批'],['已审批','已审批'],['否决','否决']]
 end
 f.actions
end

end
