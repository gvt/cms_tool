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
    respond_to do |format|
      if @account.save
        format.html { redirect_to (user_dashboard_url, :notice => "User Created")}
      else
        format.html { render :action => "new", :error => @account.errors.full_messages.to_sentence }
      end
    end
  end
end
