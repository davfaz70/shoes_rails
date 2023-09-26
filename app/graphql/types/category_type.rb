# frozen_string_literal: true

module Types
  class CategoryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :weight, Integer, null: false
    field :parent_id, Integer
    field :categories, [Types::CategoryType]

    def categories
      object.categories.all
    end

  end
end
