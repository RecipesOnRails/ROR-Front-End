class BackendService
  def self.recipe_data(id)
    response = conn.get("/recipes/#{id}")
    require "pry"; binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def self.conn
    Faraday.new(url: "https://nameless-plains-48795.herokuapp.com/api/v1")
  end
end
