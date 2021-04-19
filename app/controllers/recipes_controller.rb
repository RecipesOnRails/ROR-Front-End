class RecipesController < ApplicationController
  def show
    @recipe = BackendServiceFacade.get_recipe(recipe_id)
  end

  private

  def recipe_id
    params[:id]
  end
end
