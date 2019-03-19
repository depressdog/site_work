class CategoriesController < ApplicationController
  before_action :set_category, only: [:destroy, :show, :edit, :update]
  def index
    @categories = Category.all
    # @subcategories = Subcategory.find(params[:id])
  end
  def show
    @courses = Course.where(category_id: params[:id]).order("updated_at DESC")
  end
  def new
    @category = Category.new
    @categories = Category.all.order(:name)
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      @categories = Category.all.order(:name)
      render :new
    end
  end
  def edit
    @categories = Category.where("id != #{@category.id}").order(:name)
  end
  def update
    if @category.update_attributes(category_params)
      redirect_to @category
    else
      @categories = Category.where("id != #{@category.id}").order(:name)
      render :edit
    end
  end
  def destroy
    @category.destroy
    redirect_to categories_path
  end

  protected
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
