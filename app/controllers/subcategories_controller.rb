class SubcategoriesController < ApplicationController
  before_action :set_category, only: [:destroy, :show, :edit, :update]
  def index
    @subcategory = Subcategory.all
  end
  def show
    @courses = Course.where(subcategory_id: params[:id]).order("updated_at DESC")
  end
  def new
    @subcategory = Subcategory.new
    @categories = Category.all.order(:name)
  end
  def create
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
      redirect_to @subcategory
    else
      @categories = Category.all.order(:name)
      render :new
    end
  end
  def edit
    @categories = Category.all.order(:name)
  end
  def update
    if @subcategory.update_attributes(subcategory_params)
      redirect_to @subcategory
    else
      @categories = Category.all.order(:name)
      render :edit
    end
  end
  def destroy
    @subcategory.destroy
    redirect_to subcategories_path
  end

  protected
    def set_category
      @subcategory = Subcategory.find(params[:id])
    end

    def subcategory_params
      params.require(:subcategory).permit(:name, :category_id)
    end
end
