class ShoesColorsSize < ApplicationRecord
  belongs_to :shoe
  belongs_to :color
  belongs_to :size
end
