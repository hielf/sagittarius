ActiveAdmin.register Event do
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

permit_params :title, :image, :desc, :begin_date, :end_date,
  :send_to, :user_id, :notice, :satus

  filter :title
  filter :desc
  filter :begin_date
  filter :end_date
  filter :user, as: :select, collection: User.all.map {|u|[u.username, u.id]}
  filter :status, as: :select, collection: [['未开始','未开始'],['已开始','已开始'],['结束','结束']]



  index do
    column :image do |e|
      link_to(image_tag(e.image.url(:thumb)), e.image.url(:large), target: '_blank') unless e.image
    end
    column :title
    column :user do |e|
      e.user.username if User.find_by(id: e.user)
    end
    column :desc
    column :notice
    column :status
    actions
  end

  show do
		attributes_table do
      row :title
      row :image do |e|
        image_tag e.image.url unless e.image
      end
      row :user do |e|
        if e.user
          link_to e.user.username, admin_user_path(e.user.id)
        end
      end
      row :begin_date
      row :end_date
      row :send_to
			row :desc
			row :notice
			row :status
    end
    active_admin_comments
	end

   form do |f|
  	f.semantic_errors # shows errors on :base
  	f.inputs do
  		#f.input :title
  		f.input :title
  		f.input :image, :hint => image_tag(f.object.image.url(:large)||'')
      f.input :image_cache, :as => :hidden
      f.input :user, as: :select, collection: User.all.map {|u| [u.username, u.id]}
      f.input :desc
      f.input :begin_date
      f.input :end_date
      f.input :notice
      f.input :status, collection: [['未开始','未开始'],['已开始','已开始'],['结束','结束']]
  	end          # builds an input field for every attribute
  	f.actions         # adds the 'Submit' and 'Cancel' buttons
	end
end
