CmsTool::Application.routes.draw do
  
  get    "users/dashboard"      , :as => "user_dashboard"
  get    "user_sessions/new"    , :as => "signin"
  delete "user_sessions/destroy", :as => "signout"

  resources :accounts, :only => [:new, :create, :show]
  resources :elements # actually implements all 7 REST verbs
  resources :user_sessions, :only => [:new, :create, :destroy]

  root :to => "application#index"
  
end
