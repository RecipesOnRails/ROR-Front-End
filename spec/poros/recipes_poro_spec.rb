require 'rails_helper'

RSpec.describe "RecipePoro" do
  describe "happy path" do
    it "makes a recipe poro with given data" do
      VCR.use_cassette("recipes_show") do
        data = BackendService.recipe_data(123)

        recipe_poro = RecipePoro.new(data)
        expect(recipe_poro.title).to eq(data[:data][:attributes][:name])
        expect(recipe_poro.id).to eq(data[:data][:id])
        expect(recipe_poro.info).to eq(data[:data][:attributes][:recipe_info])
        expect(recipe_poro.instructions).to eq(data[:data][:attributes][:instructions])
        expect(recipe_poro.ingredients).to be_an(Array)
      end
    end
  end
end
