require 'pg'
require_relative 'database_connection'

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
    result = DatabaseConnection.query("SELECT * FROM rooms")
    result.map do |room|
    Room.new(room['id'], room['address'],room['description'],room['price_per_night'], room['start_date'], room['end_date'], room['owner_id'])
    end
  end


  def self.create(address, description, price_per_night, start_date, end_date, owner_id)
    result = DatabaseConnection.query(
      "INSERT INTO rooms (address, description, price_per_night, start_date, end_date, owner_id) VALUES ($1, $2, $3, $4, $5, $6);",["#{address}", "#{description}", "#{price_per_night}", "#{start_date}", "#{end_date}", "#{owner_id}"])
  end

  def self.book(room_id, date, user_id)
    room = DatabaseConnection.query("SELECT address, start_date, end_date, owner_id FROM rooms WHERE id=$1;", ["#{room_id}"])
    if date < room[0]['start_date'] || date > room[0]['end_date']
      return "Error: Chosen date is outside of available dates"
    end
    owner_id = room[0]['owner_id']
    bookingexists = DatabaseConnection.query("SELECT * FROM bookings WHERE room_id=$1 AND date=$2;", ["#{room_id}", "#{date}"])
    
    if bookingexists.cmd_tuples == 0 
      result = DatabaseConnection.query("INSERT INTO bookings (room_id, date, user_id, owner_id) VALUES ($1, $2, $3, $4);", ["#{room_id}", "#{date}", user_id, owner_id])
      Mailer.bookingrequestconfirmation(user_id, room_id, date)
      "Thank you for requesting to book #{room[0]['address']} on #{date}! The lister will now review your request"
    else 
      "Unfortunately, this room is not available on this date!"
    end
  end
end

