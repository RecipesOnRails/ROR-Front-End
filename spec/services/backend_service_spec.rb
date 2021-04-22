require 'rails_helper'

describe BackendService, type: :class do
  describe 'class methods' do
    it 'recipe_data' do
      VCR.use_cassette("recipe_show") do
        test = BackendService.recipe_data(123)
        expect(test).to have_key(:data)
        expect(test[:data]).to have_key(:attributes)
        expect(test[:data][:attributes]).to have_key(:name)
        expect(test[:data][:attributes]).to have_key(:recipe_info)
        expect(test[:data][:attributes]).to have_key(:image)
        expect(test[:data][:attributes]).to have_key(:instructions)
        expect(test[:data][:attributes]).to have_key(:ingredients)
        expect(test[:data][:attributes]).to have_key(:nutrients)
      end
    end
  end
end
