Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  resource :wechat, only: [:show, :create]
  resources :users
  namespace :api, defaults: {format: :json} do
    root 'root#home'
    post 'accounts/sign_in', to: 'accounts#sign_in'
    post 'accounts/sign_out', to: 'accounts#sign_out'
    get 'wechat_access_token', to: 'root#wechat_access_token'
    get 'qiniu/token'
    resources :users, except: [:edit, :new] do
      collection do
        get :me
        # get :home
        # get :outworker_new
        # get :staff_new
        get :teams
        get :shops
        get :areas
        get :upper_users
        # get :create_user
      end
    end
    resources :events, except: [:new, :edit] do
      collection do
        post :join_event
        get :event_data
        post :submit_data
        post :submit_photos
      end
    end
    match '*path', via: :all, to: 'root#route_not_found'
  end
  match '*path', via: :all, to: 'home#route_not_found'

end
