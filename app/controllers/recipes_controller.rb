class RecipesController < ApplicationController
  def show
    @recipe = BackendServiceFacade.get_recipe(params["id"])
  end

  def index
    @skip_search_recipes = true
    @recipes = BackendServiceFacade.get_recipes_search(params[:ingredient1])
  end
end
