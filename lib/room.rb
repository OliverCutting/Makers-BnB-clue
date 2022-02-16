require 'pg'

class Room
  attr_reader :address, :description, :price_per_night

  def initialize(address, description, price_per_night)
    @address = address
    @description = description
    @price_per_night = price_per_night
  end

  def self.list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT * FROM rooms")
    result.map do |room|
    Room.new(room['address'],room['description'],room['price_per_night'])
    end
  end

  def self.create(address, description, price_per_night)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("INSERT INTO rooms (address, description, price_per_night) VALUES ('#{address}', '#{description}', '#{price_per_night}');")
  end

  def self.book(addr)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    
    result = connection.exec("UPDATE rooms SET available = FALSE WHERE address = '#{addr}' and available = TRUE;")
   
    if result.cmd_tuples > 0
      "Thank you for booking!"
    else 
      "Unfortunately, this room is not available!"
    end
  end
end

