require 'spec_helper'

describe Account do
  before (:each) do
    User.delete_all
    @account =  Factory.create :account
    @user1 = Factory.build :user
  end
  it "is assigned 1 user" do
    @account.users << @user1
    @user1.save.should == true
    account_id  = @account.id
    @account    = Account.find(account_id)
    @account.users.size.should == 1
    @account.users.include?(@user1).should be_true
  end
  it "is assigned 2 users" do
    @user2 = Factory.build :user
    @account.users << @user1
    @account.users << @user2
    @account.users.size.should == 2
    @account.users.should include(@user1)
    @account.users.should include(@user2)
  end  
  
  describe "test automatic creation subdomain" do
    it "responds to_slug" do
      @account.name.should respond_to(:to_slug)
    end
    it "creates a slug in account.subdomain" do
      account = Factory.create(:account, :name => "Lots Of Boxes")
      account.name.to_slug.should eq(account.subdomain)
    end
  end
end
