require 'spec_helper'

describe UserSession do
  before(:all) do
    activate_authlogic # needed to use the UserSession object
  end

  it "should work when passed a User that is new_record true" do
    UserSession.create(Factory.build(:user)).should be_true
  end
end
