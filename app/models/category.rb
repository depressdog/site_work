class Category < ApplicationRecord
  has_many :courses
  has_many :subcategories, dependent: :destroy
  validates :name, presence: true
end
