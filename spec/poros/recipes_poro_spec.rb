require 'rails_helper'

RSpec.describe "RecipePoro" do
  describe "happy path" do
    it "makes a recipe poro with given data" do
      VCR.use_cassette("recipes_show") do
        data = BackendService.recipe_data(123)

        recipe_poro = RecipePoro.new(data)

        expect(recipe_poro.title).to eq(data[:title])
        expect(recipe_poro.id).to eq(data[:id])
        expect(recipe_poro.summary).to eq(data[:summary])
        expect(recipe_poro.instructions).to eq(data[:instructions])
        expect(recipe_poro.ingredients).to be_an(Array)
      end
    end
  end
end
