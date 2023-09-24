class Shoe < ApplicationRecord
    has_many :shoes_category
    has_many :categories, through: :shoes_category
    has_many :shoes_colors_size
    has_many :colors, through: :shoes_colors_size 
    has_many :sizes, through: :shoes_colors_size

end
