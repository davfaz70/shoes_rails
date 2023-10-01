class Category < ApplicationRecord
  belongs_to :category, optional: true
  has_many :categories, foreign_key: :parent_id
  has_many :shoes_category
  has_many :shoes, through: :shoes_category
end
