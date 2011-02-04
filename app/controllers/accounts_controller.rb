class AccountsController < ApplicationController
  
  def show
    @account = Account.find_by_subdomain!(request.subdomain) 
  end
  
  def new
    @account = Account.new
    @account.users.build
  end
  
  def create
    @account = Account.new(params[:account])
    
    # validate the input
    unless @account.valid? && @account.users.first.valid?
      render :action => "new", :error => @account.errors.full_messages.to_sentence
      return
    end
    
    # if valid, attempt to save
    @both_saved = false
    Account.transaction do
      @account.save!
      @account.users.first.save!
      @both_saved = true
    end
    
    # show what happened
    if @both_saved
      redirect_to (user_dashboard_url, :notice => "User Created")
    else
      render :action => "new", :error => @account.errors.full_messages.to_sentence
    end
  end
end
