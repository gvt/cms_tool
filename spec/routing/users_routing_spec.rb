require "spec_helper"

describe UserSessionsController do
  describe "routing" do
    it "recognizes and generates #dashboard" do
      { :get => "/users/dashboard" }.should route_to(:controller => "users", :action => "dashboard")
    end
  end
end