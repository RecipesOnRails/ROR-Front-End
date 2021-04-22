require 'rails_helper'

RSpec.describe "Recipe Search Page" do
  describe 'As a user' do
    describe 'once I\'ve logged in' do
      before :each do
        @user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      end

      describe 'when I visit the recipes search page' do
        it 'expects page to visit recipes path' do
          VCR.use_cassette('recipes_show') do
            visit '/recipes/123'
            expect(current_path).to eq(recipes_path)
          end
        end
      end
    end
  end
end
