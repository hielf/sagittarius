ActiveAdmin.register User do
permit_params :username, :password,
  :mobile, :role, :area_id, :shop_id, :upper_user_id,
  :upper_user_phone, :team_id, :access_token, :sign_in_count,
  :current_sign_in_at, :current_sign_in_ip, :last_sign_in_at,
  :last_sign_in_ip, :failed_attempts, :locked_at, :name, :status,
  :upper_client, :upper_user_name

filter :username
filter :name
filter :mobile
filter :role, as: :select, collection: -> {[
  ['管理员', 'admin'], ['销售员', 'staff'],
  ['促销员', 'outworker'], ['未知','unknown']]}
filter :area
#filter :shop
#filter :team
filter :status, as: :select, collection: [['已审批','已审批'],['待审批','待审批']]

  member_action :approve, method: :put do
    resource.approve
    redirect_to resource_path, notice: "已审批!"
  end

  action_item :'approve', only: :show do
  link_to '允许', approve_admin_user_path(resource), method: :put
  end

  index do
    column :username
    column :openid
    column :mobile
    column :role
    column :area
    column :name
    column 'upper user' do |u|
      if u.upper_user_id
        User.find(u.upper_user_id).username if User.where("id = #{u.upper_user_id}").size > 0
      end
    end
    #column :shop
    #column :team
    column :status
    actions
  end

  form do |f|
   f.semantic_errors # shows errors on :base
   f.inputs do
     #f.input :title
     f.input :username
     f.input :name
     #f.input :openid
     f.input :password
     f.input :mobile
     f.input :role, collection: [
       ['管理员', 'admin'], ['销售员', 'staff'],
       ['促销员', 'outworker'], ['未知','unknown']]
     f.input :area
     #f.input :shop
     #f.input :team
     f.input :upper_user_id, as: :select, collection: User.where(role: 'staff').map {|staff|[staff.username, staff.id]}
     f.input :upper_user_name
     f.input :upper_client
     f.input :status, collection: [['已审批','已审批'],['待审批','待审批']]

   end          # builds an input field for every attribute
   f.actions         # adds the 'Submit' and 'Cancel' buttons
 end
end
