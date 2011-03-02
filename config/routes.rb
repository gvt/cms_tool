CmsTool::Application.routes.draw do
  
  get "users/dashboard", :as => "user_dashboard"

  resources :accounts, :only => [:new, :create, :show]
  resources :elements # actually implements all 7 REST verbs
  resources :user_sessions, :only => [:new, :create, :destroy]

  root :to => "application#index"
  
end
