class AddFieldsToCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :username, :string
    add_column :courses, :c_username, :string
    add_column :courses, :c_phone, :string
    add_column :courses, :c_email, :string
    add_column :courses, :c_education, :string
    add_column :courses, :c_skills, :string
    add_column :courses, :c_country, :string
    add_column :courses, :c_region, :string
    add_column :courses, :c_city, :string
    add_column :courses, :c_age, :string
    add_column :courses, :c_gender, :string
    add_column :courses, :c_video_url, :string
  end
end
