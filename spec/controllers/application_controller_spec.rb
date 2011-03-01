require 'spec_helper'

##
# redefine the class to allow access for testability
class ApplicationController
  public :current_account
end

describe ApplicationController do

  describe "current_account" do
    before :each do
      activate_authlogic
    end

    it "exists" do
      controller.should respond_to("current_account")
    end

    it "returns nil when no signed in user" do
      controller.current_account.should === nil
    end

    it "returns the Account instance of the signed in User" do
      user, account = mock_signin
      controller.current_account.id.should === account.id
    end

  end

end
