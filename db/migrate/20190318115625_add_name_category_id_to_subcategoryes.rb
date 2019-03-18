class AddNameCategoryIdToSubcategoryes < ActiveRecord::Migration[5.2]
  def change
    add_column :subcategories, :name, :string
    add_column :subcategories, :category_id, :integer
  end
end
