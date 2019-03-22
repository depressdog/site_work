class CoursesController < ApplicationController
  before_action :set_course, only: [:destroy, :show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @categories = Category.all.order(:name)

    if params[:c_username].present? and params[:category_id].present?
      @courses = Course.search(params[:c_username], params[:category_id]).order('created_at DESC')
    elsif params[:c_username].present?
      @courses = Course.where("c_username LIKE ?", "%#{params[:c_username]}%").order('created_at DESC')
    elsif params[:category_id].present?
      @courses = Course.where("category_id = ?", "#{params[:category_id]}").order('created_at DESC')
    else
      @courses = Course.all.order('updated_at DESC')
    end

  end

  def show
  end

  def new
    @course = current_user.courses.build
  end
  def create
    @course = current_user.courses.build(course_params)
    if @course.save
      redirect_to root_path
    else
      redirect_to new_course_path
    end
  end
  def edit
    @categories = Category.all.order(:name)
    @subcategories = Subcategory.all.order(:name)

  end
  def update
    if @course.update_attributes(course_params)
      redirect_to @course
    else
      redirect_to edit_course_path
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
      params.require(:course).permit( :c_username )
      # params.require(:course).permit(:c_username, :body, :c_phone, :c_email, :c_education, :c_age, :c_video_url,
      #                                :price, :category_id, :subcategory_id, :subsubcategory_id, :image1, :image2, :image3, :image4, :image5, :image6,
      #                                :image7, :image8, :image9, :image10)
    end
end
