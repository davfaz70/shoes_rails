require 'rest-client'

Given(/^the system knows about the following categories:$/) do |table|
    @categories = table.hashes
    @categories.each do |category|
      if (Category.where(id: category["Id"]).empty?)
        category
        if (category["parent_id"] == "null")
          @newC = Category.create!(id: category["Id"], name: category["name"], weight: category["weight"], parent_id: nil)
        else
          @newC = Category.create!(id: category["Id"], name: category["name"], weight: category["weight"], parent_id: category["parent_id"])
        end
      else
        @oldC = Category.find_by(id: category["Id"])
        @oldC.name = category["name"]
        @oldC.weight = category["weight"]
        @oldC.parent_id=  category["parent_id"]
        @oldC.save!
      end
    end
end

When(/^I POST graphql with this body:$/) do |body|
  @response = RestClient.post('localhost:3000/graphql', body, headers={content_type: "application/json", accept: "*/*"})
end

Then(/^I should receive a response with this data:$/) do |response_json|
  @received_data = JSON.parse(@response.body)
  @expected_data = JSON.parse(response_json)
  expect(@received_data).to eq(@expected_data)  
end

Given(/^the system knows about the following shoes:$/) do |table|
  @shoes = table.hashes
    @shoes.each do |shoe|
      if (Shoe.where(id: shoe["Id"]).empty?)
        Shoe.create(id: shoe["Id"], name: shoe["name"], material: shoe["material"])
      else
        @oldS = Shoe.find_by(id: shoe["Id"])
        @oldS.name = shoe["name"]
        @oldS.material = shoe["material"]
        @oldS.save
      end
    end
end

Given(/^the system knows about the following shoes_colors_sizes relationships:$/) do |table|
  @relation = table.hashes
    @relation.each do |rel|
      if (ShoesColorsSize.where(id: rel["Id"]).empty?)
        ShoesColorsSize.create(id: rel["Id"], shoe_id: rel["shoe_id"], color_id: rel["color_id"], size_id: rel["size_id"])
      else
        @oldR = ShoesColorsSize.find_by(id: rel["Id"])
        @oldR.shoe_id = rel["shoe_id"]
        @oldR.color_id = rel["color_id"]
        @oldR.size_id = rel["size_id"]
        @oldR.save
      end
    end
end

Given(/^the system knows about the following shoes_categories:$/) do |table|
  @relation = table.hashes
    @relation.each do |rel|
      if (ShoesCategory.where(id: rel["Id"]).empty?)
        ShoesCategory.create(id: rel["Id"], shoe_id: rel["shoe_id"], category_id: rel["category_id"])
      else
        @oldR = ShoesCategory.find_by(id: rel["Id"])
        @oldR.shoe_id = rel["shoe_id"]
        @oldR.category_id = rel["category_id"]
        @oldR.save
      end
    end
end


