class UsersController < ApplicationController
  before_filter :require_user
  def dashboard
    @accounts = current_user.accounts
  end
end
