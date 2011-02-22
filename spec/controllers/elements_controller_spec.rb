require 'spec_helper'

describe ElementsController do
  before(:each) do
    activate_authlogic
    Account.delete_all
    UserSession.create @signin_user = Factory.build(:user)
    @element = Factory.create(:element)
    @request.host = "#{@element.owner.subdomain}.test.host"
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

  describe "GET index" do 
    it "assigns all accounts elements as @elements" do
      get :index
      assigns(:elements).should include(@element)
    end
  end

  describe "GET show" do  
      it "assigns the requested element as @element" do
        get :show, :id => @element.id
        assigns(:element).should eq(@element)
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
  
  end

  describe "GET edit" do
    it "assigns the requested element as @element" do
      get :edit, :id => @element.id
      assigns(:element).should eq(@element)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created element as @element" do
        Element.stub(:new).with({'these' => 'params'}) { mock_element(:save => true) }
        post :create, :element => {'these' => 'params'}
        assigns(:element).should be(mock_element)
      end

      it "redirects to the created element with notice" do
        Element.stub(:new) { mock_element(:save => true) }
        post :create, :element => {}
        response.should redirect_to(element_url(mock_element))
        flash[:notice].should_not be_nil
      end
      
      it "assigns the element owner as current subdomain" do
        post :create, :element => @element
        Element.find(@element.id).owner.subdomain.should eq(@element.owner.subdomain)
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

    end
  end

  describe "PUT update" do

    describe "with valid params" do
      before(:each) do
        @element_attrib = Factory.attributes_for(:element, :owner => @element.owner, :id => @element.id, :name => "poiu")
      end
      it "updates the requested element" do
        put :update, :id => @element.id, :element => @element_attrib
        Element.find(@element.id).name.should eq("poiu")
      end

      it "assigns the requested element as @element" do
        put :update, :id => @element.id
        assigns(:element).should eq(@element)
      end

      it "redirects to the element" do
        put :update, :id => @element.id
        response.should redirect_to(element_url(@element))
      end
      
      it "has a flash notice" do
        put :update, :id => @element.id
        flash[:notice].should_not be_nil
      end
    end

    describe "with invalid params" do
      it "re-renders the 'edit' template" do
        element_attrib = Factory.attributes_for(:element, :owner => @element.owner, :id => @element.id, :name => nil)
        put :update, :id => @element.id, :element => element_attrib
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do  
      it "destroys the requested element" do
        lambda {
          delete :destroy, :id => @element.id
        }.should change(Element, :count).by(-1)
      end
      
      it "has a flash notice" do
        delete :destroy, :id => @element.id
        flash[:notice].should_not be_nil
      end
  end
end
