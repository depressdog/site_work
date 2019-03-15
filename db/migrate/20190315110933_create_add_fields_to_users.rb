class CreateAddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :education, :string
    add_column :users, :video_url, :string
    add_column :users, :age, :integer
    add_column :users, :body, :text
  end
end
