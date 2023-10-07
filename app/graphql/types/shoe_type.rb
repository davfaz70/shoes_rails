# frozen_string_literal: true

module Types
  class ShoeType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :material, String, null: false
    field :categories, [Types::CategoryType]
    field :color_and_size, [Types::ShoesColorsSizeType]

    def categories
      @categories = object.categories.all    
    end

    def color_and_size
      object.shoes_colors_size.all
    end

    

  end
end
