require 'spec_helper'

describe User do
  
  describe "association with accounts" do
    before (:each) do
      @account1    = Factory.create :account 
      @user        = Factory.build :user , :accounts  => []
    end
    
    it "can be associated to a single account" do
      @user.accounts << @account1
      @user.save
      user_id = @user.id
      User.find(user_id).accounts.should include(@account1)
    end
    it "can be associated to multipule accounts" do
      @account2    = Factory.create :account 
      @user.accounts << @account1
      @user.accounts << @account2
      @user.save
      user_id    = @user.id
      @u = User.find(user_id)
      @u.accounts.should include(@account1)
      @u.accounts.should include(@account2) 
    end
    
    it "user.accounts and account.users jive" do
      @user.accounts << @account1
      @user.save
      @account1.users.should include(@user)
      @user.accounts.should include(@account1)
    end
  end
end
