require 'minitest/autotest'
require './lib/room'

class RoomTest < MiniTest::Test

  def setup
    @room = Room.new(:bedroom, 10, 13)
  end

  def test_it_has_category
    assert_equal :bedroom, @room.category
  end

  def test_it_has_area
    assert_equal 130, @room.area
  end
end
