require "spec_helper"

describe UserSessionsController do
  describe "routing" do
    
    it "recognizes and generates #new" do
      { :get => "/user_sessions/new" }.should route_to(:controller => "user_sessions", :action => "new")
    end
    
    it "recognizes and generates #create" do
      { :post => "/user_sessions" }.should route_to(:controller => "user_sessions", :action => "create")
    end
    
    it "recognizes and generates #delete" do
      { :delete => "/user_sessions/destroy" }.should route_to(:controller => "user_sessions", :action => "destroy")
    end
    
    it "recognizes and generates signout" do
      { :delete => signout_path }.should route_to(:action => "destroy", :controller => "user_sessions")
    end
    
    it "recognizes and generates signin" do
      { :get => signin_path }.should route_to(:controller => "user_sessions", :action => "new")
    end

  end
end
