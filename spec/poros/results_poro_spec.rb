require 'rails_helper'

RSpec.describe "ResultsPoro" do
  describe "happy path" do
    it "makes a recipe poro with given data" do
      VCR.use_cassette("recipes_show_poro") do
        data = BackendServiceFacade.get_recipes_search("chicken")
        results_poro = data[0]
        expect(results_poro.title).to be_an(String)
        expect(results_poro.id).to be_an(String)
        expect(results_poro.image).to be_an(String)
        expect(results_poro.cuisine).to be_an(String)
        expect(results_poro.calories).to be_an(Float)
      end
    end
  end
end
