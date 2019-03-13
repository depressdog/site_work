class Category < ApplicationRecord
  has_ancestry
  has_many :courses
  validates :name, presence: true
end
