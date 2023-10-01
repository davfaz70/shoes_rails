module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :shoes, [Types::ShoeType], "Find shoes" do
      argument :name, String
      argument :material, String, required: :false
    end
    def shoes(name:, material: nil)
      if (material.nil?)
        Shoe.where(name: name)
      else
        Shoe.where(name: name, material: material)
      end 
    end
    
    field :categories, [Types::CategoryType], null: false
    def categories
      Category.where(weight: 0)
    end

  end
end
