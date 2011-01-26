CmsTool::Application.routes.draw do
  
  resources :elements

  resources :user_sessions

  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  get 'user_sessions/new'
  match '/' => 'accounts#show', :constraints => { :subdomain => /.+/ } 
  root :to => "elements#home_page"
  
end
