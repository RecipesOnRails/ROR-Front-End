class RecipesController < ApplicationController
  def show
    @recipe = BackendServiceFacade.get_recipe(123)
  end
end
