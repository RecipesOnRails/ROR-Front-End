class ResultsPoro
  attr_reader :id,
              :title,
              :image,
              :cuisine,
              :calories

  def initialize(data)
    @id = data[:id]
    @title = data[:attributes][:title]
    @image = data[:attributes][:image]
    @cuisine = data[:attributes][:cuisine]
    @calories = data[:attributes][:calories]
  end
end
