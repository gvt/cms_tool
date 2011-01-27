CmsTool::Application.routes.draw do
  
  resources :elements
  resources :user_sessions
  
  constraints(Subdomain) do  
      match '/' => 'accounts#show'    
  end

  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  get 'user_sessions/new'
  
  root :to => "elements#home_page"
  
end
