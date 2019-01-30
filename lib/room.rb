class Room
atter_reader :category
  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
  end

  def area
    return @length * @width
  end
end
