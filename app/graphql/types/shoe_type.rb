# frozen_string_literal: true

module Types
  class ShoeType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :material, String, null: false
    field :categories, [Types::CategoryType]

    def categories
      object.categories.all
    end
  end
end
