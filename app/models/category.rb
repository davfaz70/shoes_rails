class Category < ApplicationRecord
  belongs_to :category
  has_many :shoes_category
  has_many :shoes, through: :shoes_category
end
