module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :shoes, [Types::ShoesColorsSizeType], "Find shoes" do
      argument :name, String, required: :false
      argument :material, String, required: :false
      argument :color, String, required: :false
      argument :size, String, required: :false
    end
    def shoes(name: nil, material: nil, color: nil, size: nil)
      @result = ShoesColorsSize.all;
      if (!name.nil?)
        @shoe_ids = Shoe.where(name: name).ids
        @result = @result.where(shoe_id: @shoe_ids)
      end 
      if (!material.nil?)
        @shoe_ids = Shoe.where(material: material).ids
        @result = @result.where(shoe_id: @shoe_ids)
      end 
      if (!color.nil?)
        @color_id = Color.find_by(color: color).id
        @result = @result.where(color_id: @color_id)
      end 
      if (!size.nil?)
        @size_id = Size.where(size: size).ids
        @result = @result.where(size_id: @size_id)
      end 
      @result
    end
    
    field :categories, [Types::CategoryType], null: false
    def categories
      Category.where(weight: 0)
    end

  end
end
