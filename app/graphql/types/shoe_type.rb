# frozen_string_literal: true

module Types
  class ShoeType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :material, String, null: false
  end
end
