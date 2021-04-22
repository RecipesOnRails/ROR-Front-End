class ResultsPoro
  attr_reader :id,
              :title,
              :image

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @image = data[:image]
  end
end
