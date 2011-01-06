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

  def mock_user(stubs={})
    (@mock_user ||= mock_model(User).as_null_object).tap do |user|
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
    before(:each) do
      User.delete_all
      @user_mock = Factory.create(:user)
    end
    it "assigns a new element as @element" do
      get :new
      assigns(:element).new_record?.should be_true 
    end
    it "assigns all users to @users" do
      get :new
      assigns(:users).should eq([@user_mock])
    end
  end

  describe "GET edit" do
    before(:each) do
      User.delete_all
      @user_mock = Factory.create(:user)
      @element_mock = Factory.create(:element)
    end
    it "assigns the requested element as @element" do
      get :edit, :id => @element_mock.id
      assigns(:element).should eq(@element_mock)
    end
    it "assigns all users to @users" do
      get :edit, :id => @element_mock.id
      assigns(:users).first.should eq(@user_mock)
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
      before do
        @element = Factory.build(:element)
        post :create, :element => {}
      end
      it "renders success" do
        response.should be_success
      end
      it "renders the new template" do  
        response.should render_template("new")
      end
      it "has flash content" do
        assigns[:element].errors.should_not be_empty
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
