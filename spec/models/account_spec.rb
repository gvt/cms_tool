require 'spec_helper'

describe Account do
  it "is assigned an user" do
    user       = Factory.create :user
    account = user.account
    account_id = account.id
    account    = Account.find(account_id)
    account.users.size.should == 1
    assert_equal true, account.users.include?(user)
  end
end
