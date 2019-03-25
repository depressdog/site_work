class Api::V1::SubsubcategoriesController < ApplicationController
  def index
    render json: Category.all
  end

  def create
    subsubcategory = Subsubcategory.create(subsubcategory_params)
    render json: subsubcategory
  end

  def destroy
    Subsubcategory.destroy(params[:id])
  end

  def update
    subsubcategory = Subsubcategory.find(params[:id])
    subsubcategory.update_attributes(subsubcategory_params)
    render json: subsubcategory
  end

  def show
    # render json: Subsubcategory.all
  end
  def item
    render json: Subsubcategory.where(subcategory_id: params[:id])
  end
  private

    def subsubcategory_params
      params.require(:subsubcategory).permit(:id, :name)
    end
end