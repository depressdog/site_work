class RemoveAncestryFromCategoryes < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :ancestry, :string
  end
end
