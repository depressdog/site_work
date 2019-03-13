class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :username
      t.text :body

      t.timestamps
    end
  end
end
