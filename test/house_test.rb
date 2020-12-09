require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'
require 'pry'

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

  def test_above_market_average?
    house1 = House.new("$400000", "123 sugar lane")
    house2 = House.new("$900000", "123 sugar lane")

    assert_equal false, house1.above_market_average?
    assert_equal true, house2.above_market_average?
  end

  def test_rooms_from_category
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house = House.new("$400000", "123 sugar lane")
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)


    assert_equal [room_1, room_2], house.rooms_from_category(:bedroom)
    assert_equal [room_3], house.rooms_from_category(:living_room)
    assert_equal [room_4], house.rooms_from_category(:basement)
  end

  def test_house_area
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house = House.new("$400000", "123 sugar lane")
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 1900, house.area
  end

  def test_house_details
    house = House.new("$400000", "123 sugar lane")
    expected = {"price"=>"$400000", "address"=>"123 sugar lane"}

    assert_equal expected, house.details
    {"$400000"=>"123 sugar lane"}
  end

  def test_rooms_sorted_by_area
    room_1 = Room.new(:bedroom, 10, '13') #130
    room_2 = Room.new(:bedroom, 11, '15') #165
    room_3 = Room.new(:living_room, 25, '15') #375
    room_4 = Room.new(:basement, 30, '41') #1230
    house = House.new("$400000", "123 sugar lane")
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal [room_4, room_3, room_2, room_1], house.rooms_sorted_by_area
  end
end
