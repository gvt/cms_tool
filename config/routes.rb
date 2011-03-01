CmsTool::Application.routes.draw do
  
  get "users/dashboard", :as => "user_dashboard"

  resources :accounts
  resources :elements
  resources :user_sessions

  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  get 'user_sessions/new'
  
  root :to => "application#index"
  
end
