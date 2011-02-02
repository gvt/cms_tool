require 'spec_helper'

describe AccountsController do
  describe "New Account" do
    it "assigns a new account in @account" do
      get :new
      assigns(:account).should be_new_record
    end
    it "builds a new user" do
      get :new
      assigns(:account).users.should_not be_nil    
    end
  end
  describe "POST create Account" do
    describe "with valid params" do
      before (:all) do
        User.delete_all
        @user = Factory.build :user
        @account = Factory.build :account, :name  => "bdfhdg1"
        @account.users << @user
      end
      it "assigns newly created account to @account" do 
        post :create, :account  => @account.attributes
        assigns(:account).users << @user
        assigns(:account).name.should eq(@account.name)
        assigns(:account).users.should include(@user)
      end
      it "redirects to users/dashboard" do
        response.should be_success
      end
    
    describe "with invalid params" do
      before do
        post :create, :account  => {}
      end
      it "renders sucess" do
        response.should be_success
      end
      it "renders the new temlate" do
        response.should render_template("new")
      end
      it "has flash content" do
        assigns[:account].errors.should_not be_empty
      end
    end
    
    end
  end
end
