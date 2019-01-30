class House
  attr_reader :address, :price, :rooms
  def initialize(price_str, address)
    @address = address
    @price = parse_price_string(price_str)
    @rooms = []
  end

  def parse_price_string(price_str)
    return price_str.gsub("$","").to_i
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    return @rooms.find_all{ |room| room.category == category}
  end

  def area
    return @rooms.map{|room| room.area}.sum
  end
end
