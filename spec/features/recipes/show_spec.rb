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

        xit 'Displays login content' do
          recipe_id = 123
          VCR.use_cassette("recipe_show_feature") do
            visit "/recipes/#{recipe_id}"

            #Recipe Name
            expect(page).to have_content("Tart Green Salad with Avocado Dressing")

            #Recipe Info
            expect(page).to have_content("You can never have too many side dish recipes, so ")
            expect(page).to have_content(" for similar recipes.")

            #Instructions
            expect(page).to have_content("Combine salad ingredients in a large bowl and season with salt and pepper.")
            expect(page).to have_content("Place dressing ingredients and 1/4 cup water in a blender and puree until smooth. Season with salt and pepper. (If thick, add water by the tablespoon.)")
            expect(page).to have_content("Drizzle salad with 1/3 cup dressing.")

            #Ingredients
            expect(page).to have_content("anchovies")
            expect(page).to have_content("hass avocado")
            expect(page).to have_content("chives")
            expect(page).to have_content("coarse salt")
            expect(page).to have_content("lemon balm")
            expect(page).to have_content("lemon juice")
            expect(page).to have_content("low fat buttermilk")
            expect(page).to have_content("sorrel")

            #Nutrients
            expect(page).to have_content("Calories 66.64 kcal")
            expect(page).to have_content("Fat 4.27 g")
            expect(page).to have_content("Saturated Fat 0.73 g")
            expect(page).to have_content("Carbohydrates 3.25 g")
            expect(page).to have_content("Sugar 1.73 g")
            expect(page).to have_content("Cholesterol 1.8 mg")
          end
        end
      end

      describe "sad path and error" do
        it "500 error" do
          id= 123
          stub_request(:get, "https://nameless-plains-48795.herokuapp.com/api/v1/recipes/#{id}").
            to_return(status: 500, body: "", headers: {})

          data = BackendService.recipe_data(id)
          expect(data).to eq({error: true})
        end
      end
    end
  end
end
