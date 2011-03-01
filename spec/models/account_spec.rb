require 'spec_helper'

describe Account do
  before :each do
    @account = Factory.create :account
    @user    = Factory.build :user
  end
  
  describe "validations" do

    it "must have a unique name" do
      account2 = Factory.build :account, :name => "#{@account.name}"
      account2.should_not be_valid
    end

  end
  
  describe "association with user" do

    it "is assigned 1 user" do
      @account.user = @user
      @user.save.should == true
      account_id  = @account.id
      @account    = Account.find(account_id)
      @account.user.id.should === @user.id
    end

  end

  describe "accepts_nested_attributes_for :user" do

    it "works" do
      user_attribs = Factory.attributes_for :user
      user_attribs.delete :account
      account_attribs = {:name => 'qwerty'}
      lambda {
        account = Account.new account_attribs.merge(:user_attributes => user_attribs)
        account.save.should be_true
        account.name.should == 'qwerty'
        account.user.should be_present
      }.should change(User, :count)
    end

  end
  
end
