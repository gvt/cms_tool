require 'spec_helper'

describe ElementsController do
  before(:each) do
    activate_authlogic
    UserSession.create Factory.build(:user)
  end

  def mock_element(stubs={})
    (@mock_element ||= mock_model(Element).as_null_object).tap do |element|
      element.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET home_page" do
    it "should render" do
      get :home_page
      response.should be_success
      response.should render_template("home_page")
    end
  end

  describe "GET index" do
    it "assigns all elements as @elements" do
      Element.stub(:all) { [mock_element] }
      get :index
      assigns(:elements).should eq([mock_element])
    end
  end

  describe "GET show" do
    it "assigns the requested element as @element" do
      Element.stub(:find).with("37") { mock_element }
      get :show, :id => "37"
      assigns(:element).should be(mock_element)
    end
  end

  describe "GET new" do
    it "assigns a new element as @element" do
      Element.stub(:new) { mock_element }
      get :new
      assigns(:element).should be(mock_element)
    end
  end

  describe "GET edit" do
    it "assigns the requested element as @element" do
      Element.stub(:find).with("37") { mock_element }
      get :edit, :id => "37"
      assigns(:element).should be(mock_element)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created element as @element" do
        Element.stub(:new).with({'these' => 'params'}) { mock_element(:save => true) }
        post :create, :element => {'these' => 'params'}
        assigns(:element).should be(mock_element)
      end

      it "redirects to the created element" do
        Element.stub(:new) { mock_element(:save => true) }
        post :create, :element => {}
        response.should redirect_to(element_url(mock_element))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved element as @element" do
        Element.stub(:new).with({'these' => 'params'}) { mock_element(:save => false) }
        post :create, :element => {'these' => 'params'}
        assigns(:element).should be(mock_element)
      end

      it "re-renders the 'new' template" do
        Element.stub(:new) { mock_element(:save => false) }
        post :create, :element => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested element" do
        Element.should_receive(:find).with("37") { mock_element }
        mock_element.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :element => {'these' => 'params'}
      end

      it "assigns the requested element as @element" do
        Element.stub(:find) { mock_element(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:element).should be(mock_element)
      end

      it "redirects to the element" do
        Element.stub(:find) { mock_element(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(element_url(mock_element))
      end
    end

    describe "with invalid params" do
      it "assigns the element as @element" do
        Element.stub(:find) { mock_element(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:element).should be(mock_element)
      end

      it "re-renders the 'edit' template" do
        Element.stub(:find) { mock_element(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested element" do
      Element.should_receive(:find).with("37") { mock_element }
      mock_element.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the elements list" do
      Element.stub(:find) { mock_element }
      delete :destroy, :id => "1"
      response.should redirect_to(elements_url)
    end
  end

end
