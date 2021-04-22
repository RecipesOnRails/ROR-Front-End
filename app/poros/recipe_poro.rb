class RecipePoro
  attr_reader :id,
              :title,
              :summary,
              :instructions,
              :ingredients,
              :nutrients

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @summary = data[:summary]
    @instructions = data[:instructions]
    @ingredients = data[:extendedIngredients].map do |ingredient|
                    ingredient[:name]
                  end
    @nutrients ="stuff and things"
  end
end
