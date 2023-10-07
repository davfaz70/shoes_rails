# frozen_string_literal: true

module Types
  class SizeType < Types::BaseObject
    field :id, ID, null: false
    field :size, String, null: false
  end
end
