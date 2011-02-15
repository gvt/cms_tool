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
    unless @account.valid?
      render :action => "new", :error => @account.errors.full_messages.to_sentence
      return
    end
    
    # if valid, attempt to save
    @both_saved = false
    begin
      Account.transaction do
        if @account.save!
          @both_saved = true
        end
      end
    rescue Exception => e
      logger.warn "could not save account or user. error: #{e.class}: #{e.message}"
      @both_saved = false
    end
    
    
    # show what happened
    if @both_saved
      redirect_to (user_dashboard_url, :notice => "User Created")
    else
      render :action => "new", :error => @account.errors.full_messages.to_sentence
    end
  end
end
