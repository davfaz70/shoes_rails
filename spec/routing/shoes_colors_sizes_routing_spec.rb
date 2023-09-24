require "rails_helper"

RSpec.describe ShoesColorsSizesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/shoes_colors_sizes").to route_to("shoes_colors_sizes#index")
    end

    it "routes to #show" do
      expect(get: "/shoes_colors_sizes/1").to route_to("shoes_colors_sizes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/shoes_colors_sizes").to route_to("shoes_colors_sizes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/shoes_colors_sizes/1").to route_to("shoes_colors_sizes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/shoes_colors_sizes/1").to route_to("shoes_colors_sizes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/shoes_colors_sizes/1").to route_to("shoes_colors_sizes#destroy", id: "1")
    end
  end
end
