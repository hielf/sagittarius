ActiveAdmin.register Photo do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model

permit_params :user_id, :event_id, :photo_type, :image, :order, :serial_code, :status

  filter :user, as: :select, collection: User.all.map {|u| [u.username, u.id]}
  filter :event
  filter :photo_type
  filter :order
  filter :serial_code
  filter :status, as: :select, collection: [['待审批','待审批'],['已审批','已审批'],['否决','否决']]

  index do
    column :user do |u|
      u.user.username unless u.user_id
    end
    column :event
    column :photo_type
    column :order
    column :serial_code
    column :image do |e|
      unless e.image.blank?
        link_to(image_tag e.image, style: 'height:50px;width:auto;', target: '_blank') 
      end
    end
    column :status

    actions
  end

  show do
    attributes_table do
      row :user do |u|
        u.user.username unless u.user
      end
      row :event
      row :photo_type
      row :order
      row :serial_code
      row :image do |e|
        image_tag e.image if e.image
      end
      row :status
    end
  end

  form do |f|
   f.semantic_errors # shows errors on :base
   f.inputs do
     f.input :user, as: :select, collection: User.all.map {|u| [u.username, u.id]}
     f.input :event
     f.input :photo_type
     f.input :order
     f.input :serial_code
     f.input :image, :hint => image_tag(f.object.image||'', style: 'height:150px;width:auto;')
     # f.input :image_cache, :as => :hidden
     f.input :status, as: :select, collection: [['待审批','待审批'],['已审批','已审批'],['否决','否决']]
   end
   f.actions
 end

end
