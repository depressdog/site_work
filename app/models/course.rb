class Course < ApplicationRecord
  belongs_to :category
  def self.search(c_username, category_id)
    self.where("category_id = ? and c_username LIKE ?", "#{category_id}", "%#{c_username}%")
  end
end
