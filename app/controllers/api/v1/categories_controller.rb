class Api::V1::CategoriesController < ApplicationController
  def index
    render json: Category.all
  end

  def create
    category = Category.create(category_params)
    render json: category
  end

  def destroy
    Category.destroy(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update_attributes(category_params)
    render json: category
  end

  def show
    render json: Category.all.order('name ASC')
  end
  private

    def category_params
      params.require(:category).permit(:id, :name)
    end
end
