# frozen_string_literal: true

module Types
  class CategoryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :weight, Integer, null: false
    field :parent_id, Integer
    field :categories, [Types::CategoryType]
    field :shoes, [Types::ShoeType], null: true do
      argument :order_by, String, required: false
    end

    def shoes(order_by: nil)
      #@exlude_shoes_ids = obtain_parent_shoes_id(object)
      if order_by == "popularity"
        object.shoes.all.order(order: :asc)
      elsif order_by == "name"
        object.shoes.all.order(name: :asc)
      else
        object.shoes.all
      end
    end
    
    def categories
      @true_categories = Category.where(parent_id: object.id)
      @categories = []
      @true_categories.each do |cate|
        @categories.push(cate)
      end 
      puts @categories.class
      @categories.each do |dummy|
        puts dummy.class
        dummy.shoes.each do |s|
          puts s.class
        end
      end
      @categories = clean_categories(@categories, object)
      puts @categories.class

      @categories.each do |dummy|
        puts dummy.class
        dummy.shoes.each do |s|
          puts s.class
        end
      end
      @categories.clone
    end

    

    def clean_categories(categories, object)
      @dummy_categories = []
      categories.each do |category|

        @new_category = category.deep_dup
        @new_category.shoes = category.shoes.deep_dup
        @new_category.shoes = category.shoes.where.not(id: object.shoes.ids)       
        if category.categories.all != []
          @new_category.categories = clean_categories(category.categories, category)
        else
          @new_category.categories = category.categories
        end 
        @dummy_categories.push(@new_category)   
      end
      return @dummy_categories      
    end



  end
end
