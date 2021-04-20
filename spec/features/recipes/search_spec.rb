require 'rails_helper'

RSpec.describe "Recipe Search Page" do
  describe 'As a user' do
    describe 'once I\'ve logged in' do
      before :each do
        @user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        visit '/recipes'
      end

      describe 'when I visit the recipes search page' do
        it 'expects page to visit recipes path' do
          expect(current_path).to eq(recipes_path)
        end

        it "has a search bar with a submit button" do
          expect(page).to have_field(:search)
          expect(page).to have_button(:submit) 
        end
      end
    end
  end
end
