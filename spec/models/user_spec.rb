require 'spec_helper'

describe User do
  it "required to have an account" do
    account    = Factory.create :account 
    user       = Factory.create :user, :account => account
    user_id    = user.id
    assert_equal account, User.find(user_id).account
  end
end
