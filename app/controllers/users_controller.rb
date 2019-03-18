class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def create
    @user.skip_email_validation = true
  end
  def my_courses
    @courses = Course.where(user_id: params[:id])
  end
end
