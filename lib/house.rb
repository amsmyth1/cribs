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
  
  def price
    price = @price.gsub('$', '').to_i 
  end 
  
  def above_market_average?
    price > 500000
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
  
  def details_alt
    { 
      "address" => @address
      "price" => price
      }
  end


  def rooms_sorted_by_area #this was supposed to be by price/sqft
    sorted = @rooms.sort_by { |room| room.area }
    sorted.reverse
  end

  def rooms_categories
    house_categories =
    @rooms.map do |room|
      room.category
    end
    house_categories.uniq!
  end

  def rooms_by_category
    bedroom_hash = Hash.new
    rooms_categories.map do |category|
      bedroom_hash[category] = rooms_from_category(category)

    end
    bedroom_hash
  end
  
  def price_per_squarefoot
    (price / area.to_f).round[2]
  end 
  
  def lecture_rooms_by_category
    @rooms.group_by do |room|
      room.category
      
      #OR
      
      hash = {}
      
      @rooms.each do |room|
        if hash[room.category]
          hash[room.category.push(room)
        else
           hash[room.category] = [room]
        end
       end 
      hash
    end 
    end 
  end 
end
