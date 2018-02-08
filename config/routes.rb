Rails.application.routes.draw do

  root 'home#index'
  resource :wechat, only: [:show, :create]
  resources :users
  namespace :api, defaults: {format: :json} do
    root 'root#home'
    post 'accounts/sign_in', to: 'accounts#sign_in'
    post 'accounts/sign_out', to: 'accounts#sign_out'
    get 'wechat_access_token', to: 'root#wechat_access_token'
    resources :users, except: [:edit, :new] do
      collection do
        get :me
        get :export_users
        get :home
        get :outworker_new
        get :staff_new
        get :teams
        get :shops
        get :areas
        get :get_openid
        get :create_user
      end
    end
    resources :suppliers, except: [:new, :edit] do
      collection do
        get :export
        post :import
      end
    end
    resources :stations, except: [:new, :edit] do
      collection do
        get :export
        post :import
      end
    end
    resources :powers, except: [:new, :edit] do
      collection do
        delete :batch_delete
        get :export
        post :import
        get :power_ports
        post :reset_port
        post :modify_power_port
        post :power_port_on
        post :power_port_off
        get :statistics
        get :near_by_powers
      end
    end
    resources :cases, except: [:new, :edit] do
      collection do
        get :export
        post :import
      end
    end
    resources :options, except: [:new, :edit] do
      collection do
        get 'option_types'
        get 'brands'
        get 'models'
        get :export
        post :import
      end
    end
    resources :notices, except: [:new, :edit] do
      collection do
        get :export
        get :statistics
      end
    end
    resources :work_orders do
      collection do
        get :export
        post :import
        get :statistics
        get :statistics_detail
        get :work_orders_list
      end
    end
    match '*path', via: :all, to: 'root#route_not_found'
  end
  match '*path', via: :all, to: 'home#route_not_found'

end
