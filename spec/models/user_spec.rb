require 'spec_helper'

describe User do
  
  describe "association with account" do

    before :each do
      @account = Factory.create :account
      @user    = Factory.build :user, :account => @account
    end
    
    it "can be associated to a single account" do
      @user.account = @account
      @user.save.should be_true
      user_id = @user.id
      User.find(user_id).account.should eql(@account)
    end
    
  end

end
