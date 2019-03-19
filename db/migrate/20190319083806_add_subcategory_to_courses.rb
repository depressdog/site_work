class AddSubcategoryToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :subcategory_id, :integer
    add_index :courses, :subcategory_id
  end
end
