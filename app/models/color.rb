class Color < ApplicationRecord
    has_many :shoes_colors_size
    has_many :shoes, through: :shoes_colors_size
end
