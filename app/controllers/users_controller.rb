class UsersController < ApplicationController
  before_filter :require_user

  def dashboard
    @account = current_user.account
  end
end
