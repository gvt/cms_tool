require 'spec_helper'

describe Account do
  it "is assigned an user" do
    account    = Factory.create :account
    user       = Factory.build :user, :account => nil
    account.users << user
    user.save.should == true
    account_id = account.id
    account    = Account.find(account_id)
    account.users.size.should == 1
    account.users.include?(user).should be_true
  end
end
