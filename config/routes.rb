First::Application.routes.draw do
  namespace :admin do
    get "profile" => "admins#profile", :as => "profile"
    get "update_profile" => "admins#update_profile", :as => "update_profile"
    put "update_profile" => "admins#update"
    resources :admins, except: [:edit, :show, :update]

    get "super_profile" => "super_admins#profile", :as => "super_profile"
    get "super_update_profile" => "super_admins#update_profile", :as => "super_update_profile"
    put "super_update_profile" => "super_admins#update"

    get "super_sign_up" => "super_admins#new", :as => "super_sign_up"
    get "new" => "admins#new", :as => "new"
    resources :super_admins, except: [:edit, :show, :update, :index]
  end

  get "log_in" => "sessions#new", :as => "log_in"
  resources :sessions, only: [:create]

  get "admin/log_in" => "sessions#new_admin", :as => "log_in_admin"
  post "admin/log_in" => "sessions#create_admin", :as => "log_in_admin"

  get "super/log_in" => "sessions#new_super_admin", :as => "log_in_super_admin"
  post "super/log_in" => "sessions#create_super_admin", :as => "log_in_super_admin"

  get "log_out" => "sessions#destroy", :as => "log_out"

  get "sign_up" => "users#new", :as => "sign_up"
  get "profile" => "users#profile", :as => "profile"

  get "reset_password/:id" => "users#reset_password", :as => "reset_password"
  put "reset_password/:id" => "users#save_password", :as => "save_password"

  get "update_profile" => "users#update_profile", :as => "update_profile"

  post "users" => "users#drag"
  resources :users, except: [:new, :edit, :show]
  root :to => "users#new"
end
