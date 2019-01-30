require 'minitest/autorun'
require './lib/house'
require './lib/room'

class HouseTest < MiniTest::Test
  def setup
    @house = House.new("$400000", "123 sugar lane")
  end

  def test_it_starts_empty_rooms

    assert_equal [], @house.rooms
  end

  def test_it_has_address
    assert_equal "123 sugar lane", @house.address
  end

  def test_it_has_int_price
    assert_equal 400000, @house.price
  end

  def test_it_has_add_room
    assert_equal [], @house.rooms
    room_1 = Room.new(:bedroom, 10,13)
    room_2 = Room.new(:bedroom, 11,15)
    room_3 = Room.new(:bathroom, 6,10)
    room_4 = Room.new(:living_room, 25,15)
    room_5 = Room.new(:basement, 30,41)
    room_list = [room_1,room_2,room_3,room_4,room_5]

    room_list.each { |room| @house.add_room(room)}


    assert_equal room_list.length, @house.rooms.length

    @house.rooms.zip(room_list).each do |house_room, added_room|
      assert_equal added_room, house_room
    end


  end

  def test_it_has_rooms_from_category
    room_1 = Room.new(:bedroom, 10,13)
    room_2 = Room.new(:bedroom, 11,15)
    room_3 = Room.new(:bathroom, 6,10)
    room_4 = Room.new(:living_room, 25,15)
    room_5 = Room.new(:basement, 30,41)
    room_list = [room_1,room_2,room_3,room_4,room_5]

    room_list.each { |room| @house.add_room(room)}

    assert_equal [room_1, room_2], @house.rooms_from_category(:bedroom)
    assert_equal [room_3], @house.rooms_from_category(:bathroom)
    assert_equal [room_4], @house.rooms_from_category(:living_room)

  end

  def test_it_has_area
    room_1 = Room.new(:bedroom, 10,13)
    room_2 = Room.new(:bedroom, 11,15)
    room_3 = Room.new(:bathroom, 6,10)
    room_4 = Room.new(:living_room, 25,15)
    room_5 = Room.new(:basement, 30,41)
    room_list = [room_1,room_2,room_3,room_4,room_5]

    room_list.each { |room| @house.add_room(room)}

    true_area = room_list.map{|room| room.area}.sum

    assert_equal true_area, @house.area
  end

  def test_it_has_price_per_sq_foot
    room_1 = Room.new(:bedroom, 10,13)
    room_2 = Room.new(:bedroom, 11,15)
    room_3 = Room.new(:bathroom, 6,10)
    room_4 = Room.new(:living_room, 25,15)
    room_5 = Room.new(:basement, 30,41)
    room_list = [room_1,room_2,room_3,room_4,room_5]

    room_list.each { |room| @house.add_room(room)}

    true_area = room_list.map{|room| room.area}.sum

    true_price_per_sq_ft = true_area.to_f / 400000

    assert_equal true_price_per_sq_ft, @house.price_per_square_foot
  end

  def test_it_has_room_sorted_by_area
    room_1 = Room.new(:bedroom, 10,13)
    room_2 = Room.new(:bedroom, 11,15)
    room_3 = Room.new(:bathroom, 6,10)
    room_4 = Room.new(:living_room, 25,15)
    room_5 = Room.new(:basement, 30,41)
    room_list = [room_1,room_2,room_3,room_4,room_5]

    room_list.each { |room| @house.add_room(room)}

    sorted_rooms = room_list.sort_by{ |room| room.area}

    @house.rooms_sorted_by_area.zip(sorted_rooms){
      |house_room, sorted_room|
      assert_equal sorted_room, house_room
    }

  end

  def test_it_has_rooms_by_category
    room_1 = Room.new(:bedroom, 10,13)
    room_2 = Room.new(:bedroom, 11,15)
    room_3 = Room.new(:bathroom, 6,10)
    room_4 = Room.new(:living_room, 25,15)
    room_5 = Room.new(:basement, 30,41)
    room_list = [room_1,room_2,room_3,room_4,room_5]

    room_list.each { |room| @house.add_room(room)}

    room_by_cat = {}
    room_list.each { |room|
      if !room_by_cat.keys.include?(room.category)
        room_by_cat[room.category] = [room]
      else
        room_by_cat[room.category] << room
      end
    }
    puts room_by_cat.keys
    room_by_cat.keys.each{ |category|
      assert_equal room_by_cat[category], @house.rooms_by_category[category]
    }
  end
end
