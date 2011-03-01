require 'spec_helper'

describe ElementsController do
  before :each do
    @signin_user, @account = mock_signin
    @element               = Factory.create :element, :account => @account
  end
    
  describe "GET index" do 
    it "assigns all accounts elements as @elements" do
      get :index
      assigns(:elements).should include(@element)
    end
    
    it "can render correct JSON" do
      @request.env["HTTP_ACCEPT"] = "application/json"
      get :index
      response.body.should eq(assigns(:elements).to_json)
    end
  end

  describe "GET show" do  
      it "assigns the requested element as @element" do
        get :show, :id => @element.id
        assigns(:element).should eq(@element)
      end
      it "can render correct JSON" do
         @request.env["HTTP_ACCEPT"] = "application/json"
         get :show, :id => @element.id
         response.body.should eq(assigns(:element).to_json)
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
      before(:each) do
        @element_attrib = Factory.attributes_for(:element)
      end
      it "assigns a newly created element as @element" do
        post :create, :element => @element_attrib
        assigns(:element).name.should eq(@element_attrib.fetch(:name))
      end

      it "redirects to the created element with notice" do
        post :create, :element =>  @element_attrib
        response.should redirect_to(element_url(assigns(:element)))
        flash[:notice].should_not be_nil
      end
      
      it "can render correct JSON" do
        @element_attrib = Factory.attributes_for(:element)
        @request.env["HTTP_ACCEPT"] = "application/json"
        post :create, :element => @element_attrib
        response.body.should eq(assigns(:element).to_json)
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
     it "can render correct JSON" do
        @request.env["HTTP_ACCEPT"] = "application/json"
        post :create, :element => {}
        response.body.should eq(assigns(:element).errors.to_json)
      end
    end
  end

  describe "PUT update" do

    describe "with valid params" do
      before(:each) do
        @element_attrib = Factory.attributes_for(:element, :account => @element.account, :id => @element.id, :name => "poiu")
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
      it "can render correct JSON" do
        @request.env["HTTP_ACCEPT"] = "application/json"
        post :update, :id => @element.id, :element => @element_attrib
        response.should be_success
      end
    end

    describe "with invalid params" do
      before(:each) do
          @element_attrib = Factory.attributes_for(:element, :account => @element.account, :id => @element.id, :name => nil)
      end
      it "re-renders the 'edit' template" do
        put :update, :id => @element.id, :element => @element_attrib
        response.should render_template("edit")
      end
      it "can render correct JSON" do
        @request.env["HTTP_ACCEPT"] = "application/json"
        post :update, :id => @element.id, :element => @element_attrib
        response.body.should eq(assigns(:element).errors.to_json)
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
      
      it "can render correct JSON" do
        @request.env["HTTP_ACCEPT"] = "application/json"
        post :destroy, :id => @element.id
        response.should be_success
      end
  end
end
