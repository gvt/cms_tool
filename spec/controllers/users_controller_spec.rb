require 'spec_helper'

describe UsersController do
  before(:each) do
    activate_authlogic
    @current_user_mock = Factory.build(:user, :accounts => [Factory.create(:account), Factory.create(:account)])
    UserSession.create(@current_user_mock) 
  end
  describe "User Dashboard" do
    it "assigns all logged in users accounts to @accounts" do
      get :dashboard
      assigns(:current_user).should eq(@current_user_mock)
      assigns[:accounts].should eq(@current_user_mock.accounts)
    end
  end
end
