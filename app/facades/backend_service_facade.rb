class BackendServiceFacade
  def self.get_recipe(id)
    BackendService.recipe_data(id)[:data]
  end
end
 
