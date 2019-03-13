class CoursesController < ApplicationController
  before_action :set_course, only: [:destroy, :show, :edit, :update]
  def index
    @courses = Course.all
  end
  def show
  end
  def new
    @course = Course.new
  end
  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @course.update_attributes(course_params)
      redirect_to @course
    else
      render :edit
    end
  end
  def destroy
    @course.destroy
    redirect_to courses_path
  end

  protected
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:c_username, :body, :c_phone, :c_email, :c_education, :c_age, :c_video_url, :price)
    end
end
