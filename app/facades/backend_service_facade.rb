class BackendServiceFacade
  def self.get_recipe(id)
    BackendService.recipe_data(id)[:data]
  end

  def self.get_recipes_search(ingredient1)
    BackendService.recipe_search_data(ingredient1)[:results]
  end
end
