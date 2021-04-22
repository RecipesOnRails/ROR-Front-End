require 'rails_helper'

describe BackendService, type: :class do
  describe 'class methods' do
    it 'recipe_data' do
      VCR.use_cassette("recipe_show") do
        test = BackendService.recipe_data(123)
        expect(test).to have_key(:id)
        expect(test).to have_key(:title)
        expect(test).to have_key(:summary)
        expect(test).to have_key(:image)
        expect(test).to have_key(:instructions)

      end
    end
  end
end
