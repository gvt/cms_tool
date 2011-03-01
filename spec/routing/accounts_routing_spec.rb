require "spec_helper"

describe AccountsController do
  describe "routing" do
    
    it "recognizes and generates #new" do
      { :get => "/accounts/new" }.should route_to(:controller => "accounts", :action => "new")
    end
    
    it "recognizes and generates #create" do
      { :post => "/accounts" }.should route_to(:controller => "accounts", :action => "create")
    end
    
    it "recognizes and generates #show" do
      { :get => "/accounts/123" }.should route_to(:controller => "accounts", :action => "show", :id => "123")
    end

  end
end
