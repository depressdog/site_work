class CreateSubsubcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :subsubcategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
