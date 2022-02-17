require 'pg'

class Booking
  attr_reader :id, :address, :date, :user_id, :owner_id

  def initialize(id, address, date, user_id, owner_id)
    @id = id
    @address = address
    @date = date
    @user_id = user_id
    @owner_id = owner_id
  end

  def self.requests(owner_id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT bookings.id, address, date, user_id, bookings.owner_id FROM bookings JOIN rooms ON (rooms.id=bookings.id) WHERE bookings.owner_id=#{owner_id}")
    result.map do |booking|
    Booking.new(booking['id'], booking['address'], booking['date'], booking['user_id'], booking['owner_id'])
    end
  end
end
