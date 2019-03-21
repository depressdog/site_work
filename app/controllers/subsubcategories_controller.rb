class SubsubcategoriesController < ApplicationController
  before_action :set_category, only: [:destroy, :show, :edit, :update]
  def index
    @subsubcategory = Subsubcategory.all
  end
  def show
    @courses = Course.where(subsubcategory_id: params[:id]).order("updated_at DESC")
  end
  def new
    @subsubcategory = Subsubcategory.new
    @subcategories = Subcategory.all.order(:name)
  end
  def create
    @subsubcategory = Subsubcategory.new(subsubcategory_params)
    if @subsubcategory.save
      redirect_to @subsubcategory
    else
      @subcategories = Subcategory.all.order(:name)
      render :new
    end
  end
  def edit
    @subcategories = Subcategory.all.order(:name)
  end
  def update
    if @subsubcategory.update_attributes(subsubcategory_params)
      redirect_to @subsubcategory
    else
      @subcategories = Subcategory.all.order(:name)
      render :edit
    end
  end
  def destroy
    @subsubcategory.destroy
    redirect_to subsubcategories_path
  end

  protected
    def set_category
      @subsubcategory = Subsubcategory.find(params[:id])
    end

    def subsubcategory_params
      params.require(:subsubcategory).permit(:name, :subcategory_id)
    end
end
