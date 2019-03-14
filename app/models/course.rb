class Course < ApplicationRecord
  belongs_to :category
  def self.search(c_username)
    self.where("c_username LIKE ?", "%#{c_username}%")
  end
end
