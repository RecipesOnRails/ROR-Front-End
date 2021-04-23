class RecipePoro 
  attr_reader :id,
              :title,
              :info,
              :instructions,
              :ingredients,
              :nutrients,
              :image

  def initialize(data)
    @id = data[:data][:id]
    @title = data[:data][:attributes][:name]
    @info = data[:data][:attributes][:recipe_info]
    @instructions = data[:data][:attributes][:instructions]
    @ingredients = data[:data][:attributes][:ingredients]
    @nutrients = data[:data][:attributes][:nutrients]
    @image = data[:data][:attributes][:image]
  end
end
