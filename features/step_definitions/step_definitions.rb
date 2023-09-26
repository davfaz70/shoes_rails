require 'rest-client'

Given(/^the system knows about the following categories:$/) do |table|
    @categories = table.hashes
    @categories.each do |category|
      if (Category.where(id: category["Id"]).empty?)
        Category.create(id: category["Id"], name: category["name"], weight: category["weight"], parent_id: category["parent_id"])
      else
        @oldC = Category.find_by(id: category["Id"])
        @oldC.name = category["name"]
        @oldC.weight = category["weight"]
        @oldC.parent_id=  category["parent_id"]
        @oldC.save
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


