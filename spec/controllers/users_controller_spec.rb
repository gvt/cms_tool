require 'spec_helper'

describe UsersController do
  before :each do
    @current_user_mock, @account = mock_signin
  end

  describe "User Dashboard" do
    it "assigns signed-in users account to @account" do
      get :dashboard
      assigns(:current_user).should eq(@current_user_mock)
      assigns[:account].should      eq(@current_user_mock.account)
    end
  end

end
