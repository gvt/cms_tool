require 'spec_helper'

describe AccountsController do
  describe "New Account" do
    it "assigns a new account in @account" do
      get :new
      assigns(:account).should be_new_record
    end
    it "builds a new user" do
      get :new
      assigns(:account).user.should_not be_nil    
    end
  end

  describe "POST create Account" do

    describe "with valid params" do

      before :all do
        User.delete_all
        Account.delete_all
        @user_attribs    = Factory.attributes_for :user
        @account_attribs = Factory.attributes_for :account
        @user_attribs.delete :accounts
      end

      it "assigns newly created account to @account" do
        submit_attribs = @account_attribs.merge(:user_attributes => @user_attribs)
        lambda {
          lambda {
            post :create, {:account => submit_attribs}
            response.should redirect_to(user_dashboard_url)
          }.should change(Account,:count)
        }.should change(User,:count) 

        assigns(:account).name.should == @account_attribs[:name]
        assigns(:account).user.login.should == @user_attribs[:login]
      end

      it "redirects to users/dashboard" do
        response.should be_success
      end
    
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
