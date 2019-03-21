class Subcategory < ApplicationRecord
  belongs_to :category

  has_many :courses
  has_many :subsubcategories, dependent: :destroy

  validates :name, presence: true
end
