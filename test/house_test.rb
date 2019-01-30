require 'minitest/autorun'
require './lib/house'
require './lib/room'

class HouseTest < MiniTest::Test
  def setup
    @house = House.new("$400000", "123 sugar lane")
  end

  def test_it_starts_empty_rooms
    house2 = House.new("$1","address")
    assert_equal [], house2.rooms
  end

  def test_it_has_address
    assert_equal "123 sugar lane", @house.address
  end

  def test_it_has_int_price
    assert_equal 400000, house.price
  end

  def test_it_has_add_room
    assert_equal [], @house.rooms
    room_1 = Room.new(:bedroom, 10,13)
    room_2 = Room.new(:bedroom, 11,15)
    room_3 = Room.new(:bathroom, 6,10)
    room_list = [room_1,room_2,room_3]

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)

    assert_equal 3, @house.rooms.length

    @house.rooms.zip(room_list]).each do |house_room, added_room|
      assert_equal added_room, house_room
    end


  end
end
