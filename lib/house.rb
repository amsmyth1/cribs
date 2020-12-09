class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price.gsub('$','').to_i > 500000
  end

  def rooms_from_category(x)
    @rooms.select do |room|
      if room.category == x
      room
      end
    end
  end

  def area
    house_room_area_array.inject{ |sum,x| sum + x }
  end

  def house_room_area_array
    total_area = 0
    @rooms.map do |room|
      total_area + room.area
    end
  end


  def details
    details_hash = Hash.new
    details_hash["price"] = @price
    details_hash["address"] = address
    details_hash
  end
end
