First::Application.routes.draw do
  namespace :admin do
    get "sign_up" => "admins#new", :as => "sign_up"
    get "profile" => "admins#profile", :as => "profile"
    resources :admins
  end


  get "admin/log_in" => "sessions#new_admin", :as => "log_in_admin"
  post "admin/log_in" => "sessions#create_admin", :as => "log_in_admin"


  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"

  get "sign_up" => "users#new", :as => "sign_up"
  get "update_profile" => "users#update_profile", :as => "update_profile"
  get "profile" => "users#profile", :as => "profile"

  root :to => "users#new"
  resources :users
  resources :sessions
end
