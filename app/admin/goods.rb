ActiveAdmin.register Good do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
permit_params :event_id, :brand, :name, :image

filter :event
filter :brand
filter :name

  index do
    column :event
    column :brand
    column :name
    column :image do |e|
      link_to(image_tag(e.image.url(:thumb)), e.image.url(:large), target: '_blank') unless e.image
    end
    actions
  end

  show do
    attributes_table do
      row :event
      row :brand
      row :name
      row :image do |e|
        image_tag e.image.url unless e.image
      end
    end
  end

  form do |f|
   f.semantic_errors # shows errors on :base
   f.inputs do
     f.input :event
     f.input :brand
     f.input :name
     f.input :image, :hint => image_tag(f.object.image.url(:large)||'')
     f.input :image_cache, :as => :hidden
   end
   f.actions
 end

end
