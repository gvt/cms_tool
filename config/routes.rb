CmsTool::Application.routes.draw do
  
  get "users/dashboard", :as => "user_dashboard"

  resources :elements
  resources :user_sessions
  resources :accounts
  
  constraints(Subdomain) do  
      match '/' => 'accounts#show'    
  end

  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  get 'user_sessions/new'
  
  root :to => "application#index"
  
end
