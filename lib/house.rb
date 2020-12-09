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

  def rooms_from_category
  end

  def area
    #add all room areas
  end

  def details
    #return a hash with {"price" => "address"}
  end
end
