class BackendServiceFacade
  def self.get_recipe(id)
    data = BackendService.recipe_data(id)
    RecipePoro.new(data)
  end

  def self.get_recipes_search(ingredient1)
    data = BackendService.recipe_search_data(ingredient1)
  end
end
