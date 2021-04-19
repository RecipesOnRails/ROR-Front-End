class BackendService
  def self.recipe_data(id)
    response = conn.get("/recipes/#{id}")

    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new(url: "https://nameless-plains-48795.herokuapp.com")
  end
end
