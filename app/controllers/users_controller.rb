class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def create
    @user.skip_email_validation = true
  end
end
