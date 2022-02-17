require 'pg'

class Room
  attr_reader :id, :address, :description, :price_per_night, :start_date, :end_date

  def initialize(id, address, description, price_per_night, start_date, end_date, owner_id)
    @id = id
    @address = address
    @description = description
    @price_per_night = price_per_night
    @start_date = start_date
    @end_date = end_date
    @owner_id = owner_id
  end

  def self.list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT * FROM rooms")
    result.map do |room|
    Room.new(room['id'], room['address'],room['description'],room['price_per_night'], room['start_date'], room['end_date'], room['owner_id'])
    end
  end

  def self.create(address, description, price_per_night, start_date, end_date, owner_id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec(
      "INSERT INTO rooms (address, description, price_per_night, start_date, end_date, owner_id) VALUES ('#{address}', '#{description}', '#{price_per_night}', '#{start_date}', '#{end_date}', #{owner_id});")
  end

  def self.book(room_id, date, user_id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    room = connection.exec("SELECT address, start_date, end_date FROM rooms WHERE id=#{room_id};")
    
    if date < room[0]['start_date'] || date > room[0]['end_date']
      return "Error: Chosen date is outside of available dates"
    end

    bookingexists = connection.exec("SELECT * FROM bookings WHERE room_id='#{room_id}' AND date='#{date}';")
    # p owner_id_table = connection.exec("SELECT owner_id FROM rooms WHERE id='#{room_id}';")
    # owner_id_table
    # p owner_id = owner_id_table[0]['owner_id']
    
    if bookingexists.cmd_tuples == 0 
      result = connection.exec("INSERT INTO bookings (room_id, date, user_id) VALUES (#{room_id}, '#{date}', #{user_id});")
      "Thank you for booking #{room[0]['address']} on #{date}!"
    else 
      "Unfortunately, this room is not available on this date!"
    end
  end
end

