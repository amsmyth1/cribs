require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class RoomTest < Minitest::Test
  def test_it_exists
    room = Room.new(:bedroom, 10, '13')
    house = House.new("$400000", "123 sugar lane")
    assert_instance_of House, house
  end

  def test_it_has_readable_attributes
    room = Room.new(:bedroom, 10, '13')
    house = House.new("$400000", "123 sugar lane")

    assert_equal [], house.rooms
    assert_equal "$400000", house.price
    assert_equal "123 sugar lane", house.address
  end

  def test_add_room
    room_1 = Room.new(:bedroom, 10, '13')
    house = House.new("$400000", "123 sugar lane")
    house.add_room(room_1)

    assert_equal [room_1], house.rooms

    room_2 = Room.new(:bedroom, 11, '15')
    house.add_room(room_2)

    assert_equal [room_1, room_2], house.rooms
  end

  def test_above_market_average
  end

  def test_rooms_from_category
  end

  def test_house_area
  end

  def test_house_details
  end 
end
