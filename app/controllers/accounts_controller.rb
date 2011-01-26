class AccountsController < ApplicationController
  
  def show
    @account = Account.find_by_subdomain!(request.subdomain) 
  end
end
