require 'rails_helper'

RSpec.describe 'Recipe Show Page' do
  describe "Happy Paths" do
    it 'Displays login content' do
      recipe_id = 123
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

  describe "Sad Paths" do
    xit 'Displays login content' do
      recipe_id = 123123123123123123123
      visit "/recipes/#{recipe_id}"

      expect(page).to have_content("No such recipe exists")

    end
  end
end
