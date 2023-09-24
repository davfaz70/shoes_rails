require "rails_helper"

RSpec.describe ShoesCategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/shoes_categories").to route_to("shoes_categories#index")
    end

    it "routes to #show" do
      expect(get: "/shoes_categories/1").to route_to("shoes_categories#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/shoes_categories").to route_to("shoes_categories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/shoes_categories/1").to route_to("shoes_categories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/shoes_categories/1").to route_to("shoes_categories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/shoes_categories/1").to route_to("shoes_categories#destroy", id: "1")
    end
  end
end
