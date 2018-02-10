ActiveAdmin.register Photo do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model

permit_params :user_id, :event_id, :type, :image, :order, :serial_code, :status

  filter :user, as: :select, collection: User.all.map {|u| [u.username, u.id]}
  filter :event
  filter :type
  filter :order
  filter :serial_code
  filter :status, as: :select, collection: [['待审批','待审批'],['已审批','已审批'],['否决','否决']]

  index do
    column :user do |u|
      u.user.username unless u.user
    end
    column :event
    column :type
    column :order
    column :serial_code
    column :image do |e|
      link_to(image_tag(e.image.url(:thumb)), e.image.url(:large), target: '_blank') unless e.image
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
      row :type
      row :order
      row :serial_code
      row :image do |e|
        image_tag e.image.url unless e.image
      end
      row :status
    end
  end

  form do |f|
   f.semantic_errors # shows errors on :base
   f.inputs do
     f.input :user, as: :select, collection: User.all.map {|u| [u.username, u.id]}
     f.input :event
     f.input :type
     f.input :order
     f.input :serial_code
     f.input :image, :hint => image_tag(f.object.image.url(:large)||'')
     f.input :image_cache, :as => :hidden
     f.input :status, as: :select, collection: [['待审批','待审批'],['已审批','已审批'],['否决','否决']]
   end
   f.actions
 end

end
