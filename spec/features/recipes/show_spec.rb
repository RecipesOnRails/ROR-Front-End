require 'rails_helper'

RSpec.describe "Recipe Search Page" do
  describe "As an unauthenticated user" do
    describe "when I visit a recipe show  page it" do
      it "redirects me to the login page with a flash message" do
        visit "/recipes/123"

        expect(current_path).to eq(root_path)
        expect(page).to have_content("You must be logged in to view this page")
      end
    end
  end
  
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
            expect(current_path).to eq('/recipes/123')
          end
        end
      end

      describe "sad path and error" do
        it "500 error" do
          ingredient = "chicken"
          stub_request(:get, "https://api.spoonacular.com/recipes/123/information?apiKey=296c69ea4ec3407d848370782126a86d").
            to_return(status: 500, body: "", headers: {})

          data = BackendService.recipe_data(123)
          expect(data).to eq({error: true})
        end
      end
    end
  end
end
