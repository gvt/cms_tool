require "spec_helper"

describe ElementsController do
  describe "routing" do

    pending "recognizes and generates #home_page" do
      { :get => "http://example.com/" }.should route_to(:controller => "elements", :action => "home_page")
    end
    
    pending "recognizes and generates #home_page" do
      { :get => "http://foo.example.com/" }.should route_to(:controller => "accounts", :action => "show", :subdomain  => "foo")
    end
    
    it "recognizes and generates #index" do
      { :get => "/elements" }.should route_to(:controller => "elements", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/elements/new" }.should route_to(:controller => "elements", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/elements/1" }.should route_to(:controller => "elements", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/elements/1/edit" }.should route_to(:controller => "elements", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/elements" }.should route_to(:controller => "elements", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/elements/1" }.should route_to(:controller => "elements", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/elements/1" }.should route_to(:controller => "elements", :action => "destroy", :id => "1")
    end

  end
end
