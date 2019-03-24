class Api::V1::SubcategoriesController < ApplicationController
  def index
    render json: Subcategory.all
  end

  def create
    subcategory = Subcategory.create(subcategory_params)
    render json: subcategory
  end

  def destroy
    Subcategory.destroy(params[:id])
  end

  def update
    subcategory = Subcategory.find(params[:id])
    subcategory.update_attributes(subcategory_params)
    render json: subcategory
  end

  def show
    render json: Subcategory.all.order('name asc')
  end
  def item
    render json: Subcategory.where(category_id: params[:id])
  end

  private

    def subcategory_params
      params.require(:subcategory).permit(:id, :name)
    end
end
