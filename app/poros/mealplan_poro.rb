class MealplanPoro
  attr_reader :id,
              :recipe_id

  def initialize(data)
    @id = data[:user_id] || 1 
    @recipe_id = data[:recipe_id]
  end

end
