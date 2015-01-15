First::Application.routes.draw do
  namespace :admin do
    get "sign_up" => "admins#new", :as => "sign_up"
    get "profile" => "admins#profile", :as => "profile"
    get "update_profile" => "admins#update_profile", :as => "update_profile"
    put "update_profile" => "admins#update"
    resources :admins, except: [git:edit, :show, :update, :index]
  end


  get "log_in" => "sessions#new", :as => "log_in"
  resources :sessions, only: [:create]
  get "admin/log_in" => "sessions#new_admin", :as => "log_in_admin"
  post "admin/log_in" => "sessions#create_admin", :as => "log_in_admin"
  get "log_out" => "sessions#destroy", :as => "log_out"

  get "sign_up" => "users#new", :as => "sign_up"
  get "profile" => "users#profile", :as => "profile"
  get "update_profile" => "users#update_profile", :as => "update_profile"

  resources :users, except: [:new, :edit, :show]
  root :to => "users#new"
end
