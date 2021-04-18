require 'rails_helper'

describe BackendApiService, type: :class do
  describe 'class methods' do
    it 'recipe_data' do
      test = BackendService.recipe_data(123)

      expect(test).to have_key(:data)
      expect(test[:data]).to have_key(:id)
      expect(test[:data]).to have_key(:type)
      expect(test[:data]).to have_key(:attributes)
      expect(test[:data][:attributes][:name]).to be_a(String)
      expect(test[:data][:attributes]).to have_key(:recipe_info)
      expect(test[:data][:attributes][:recipe_info]).to be_a(String)
      expect(test[:data][:attributes]).to have_key(:instructions)
      expect(test[:data][:attributes][:instructions]).to be_an Array
      expect(test[:data][:attributes][:instructions][0]).to be_a(Hash)
      expect(test[:data][:attributes][:instructions][0]).to have_key(:step)
      expect(test[:data][:attributes][:instructions][0]).to have_key(:instruction)
      expect(test[:data][:attributes][:instructions][0][:step]).to be_an(Integer)
      expect(test[:data][:attributes][:instructions][0][:instruction]).to be_a(String)
      expect(test[:data][:attributes]).to have_key(:ingredients)
      expect(test[:data][:attributes][:ingredients]).to be_an(Array)
      expect(test[:data][:attributes][:ingredients][0]).to be_a(Hash)
      expect(test[:data][:attributes][:ingredients][0]).to have_key(:name)
      expect(test[:data][:attributes][:ingredients][0]).to have_key(:amount)
      expect(test[:data][:attributes][:ingredients][0][:name]).to be_a(String)
      expect(test[:data][:attributes][:ingredients][0][:amount]).to be_a(String)
      expect(test[:data][:attributes]).to have_key(:nutrients)
      expect(test[:data][:attributes][:nutrients]).to be_an(Array)
      expect(test[:data][:attributes][:nutrients][0]).to be_a(Hash)
      expect(test[:data][:attributes][:nutrients][0]).to have_key(:name)
      expect(test[:data][:attributes][:nutrients][0]).to have_key(:amount)
      expect(test[:data][:attributes][:nutrients][0][:name]).to be_a(String)
      expect(test[:data][:attributes][:nutrients][0][:amount]).to be_a(String)
    end
  end
end
