class BackendService
  def self.recipe_data(id)
    response = conn.get("/api/v1/recipes/#{id}")
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
    response = conn.get("/api/v1/recipes?ingredient=#{ingredient}")
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
    Faraday.new(url: "https://nameless-plains-48795.herokuapp.com")
  end

  def self.json_parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
