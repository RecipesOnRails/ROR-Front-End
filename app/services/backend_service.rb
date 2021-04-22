class BackendService
  def self.recipe_data(id)
    #response = conn.get("/recipes/#{id}")
    response = conn.get("/recipes/#{id}/information?apiKey=296c69ea4ec3407d848370782126a86d")
    if response.status == 200
      json_parse(response)
    else
      response = Hash.new([])
      response[:error] = true
      response
    end
  end

  def self.recipe_search_data(ingredient)
    #conn.get("/recipes?#{ingredient}")
    response = conn.get("/recipes/complexSearch?apiKey=296c69ea4ec3407d848370782126a86d&includeIngredients=#{ingredient}")
    if response.status == 200
      json_parse(response)
    else
      response = Hash.new([])
      response[:error] = true
      response
    end
  end

  private
  def self.conn
    #https://nameless-plains-48795.herokuapp.com/api/v1/
    Faraday.new(url: "https://api.spoonacular.com")
  end

  def self.json_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
