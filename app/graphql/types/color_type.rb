# frozen_string_literal: true

module Types
  class ColorType < Types::BaseObject
    field :id, ID, null: false
    field :color, String, null: false
  end
end
