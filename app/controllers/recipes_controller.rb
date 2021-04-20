class RecipesController < ApplicationController
  def show
    food = File.read('spec/fixtures/recipe_view.json')
    food = JSON.parse(food, symbolize_names: true)[:data]
    # @recipe = BackendServiceFacade.get_recipe(recipe_id)
    @recipe = food
  end

  private

  def recipe_id
    params[:id]
  end
end
