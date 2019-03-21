class AddSubCategoryToSubSubCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :subsubcategories, :subcategory_id, :integer
    add_column :courses, :subsubcategory_id, :integer
    add_index :courses, :subsubcategory_id
  end
end
