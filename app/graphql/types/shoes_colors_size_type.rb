# frozen_string_literal: true

module Types
  class ShoesColorsSizeType < Types::BaseObject
    field :id, ID, null: false
    field :shoe_id, Integer, null: false
    field :color_id, Integer, null: false
    field :size_id, Integer, null: false
    field :color, Types::ColorType
    field :size, Types::SizeType
    field :shoe, Types::ShoeType

    def color
      object.color
    end

    def size
      object.size
    end

    def shoe
      object.shoe
    end

  end
end
