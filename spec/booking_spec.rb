require 'booking'

describe Booking do
  describe '.requests' do
    it 'shows all booking requests' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO bookings (room_id, date, user_id, owner_id) VALUES (2, '2022-02-07', 1, 1);")
      rooms = Booking.requests(1)
      expect(rooms.first.id).to eq('1')
    end
  end
end
