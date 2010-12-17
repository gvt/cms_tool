require 'spec_helper'

describe User do
  it "required to have an account" do
    user       = Factory.build :user, :account => nil
    user.valid?.should be_false
    user.save.should be_false
  end
  
  it "make sure association works as expected" do
    account    = Factory.create :account 
    user       = Factory.create :user, :account => account
    user_id    = user.id
    User.find(user_id).account.should == account
  end
end
