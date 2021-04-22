require 'rails_helper'

RSpec.describe "BackendServiceFacade" do
  describe ".get_recipe" do
    it "returns a RecipePoro object" do
      VCR.use_cassette("recipes_show") do
        id = 123
        expect(BackendServiceFacade.get_recipe(id)).to be_an(RecipePoro)
      end
    end

    it "returns proper attributes with the poro" do
      VCR.use_cassette("recipes_show") do
        id = 123
        a = BackendServiceFacade.get_recipe(id)
        expect(a).to be_an(RecipePoro)
        expect(a.id).to eq(123)
        expect(a.ingredients).to be_an(Array)
        expect(a.instructions).to be_an(String)
        expect(a.nutrients).to be_an(String)
        expect(a.summary).to be_an(String)
        expect(a.title).to be_an(String)
      end
    end
  end

  describe ".get_recipes_search" do
    
  end
end
