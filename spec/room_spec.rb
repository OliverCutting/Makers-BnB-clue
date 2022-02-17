require 'room'

describe Room do
  describe '.list' do
    it 'posts all rooms' do
      PG.connect(dbname: 'makersbnb_test')
      rooms = Room.list
      expect(rooms.first.address).to eq('123 Fake Lane')
    end
  end

  describe '.create' do
    it 'creates a new room' do
      PG.connect(dbname: 'makersbnb_test')
      Room.create('321 Lane Fake', '3 storey treehouse with open fire', '£200', '2022-02-05', '2022-02-10')
      rooms = Room.list
      expect(rooms.last.address).to eq('321 Lane Fake')
    end
  end

  describe '.book' do
    it 'allows the user to book the room' do
      connection = PG.connect(dbname: 'makersbnb_test')
      expect(Room.book(1, '2022-02-07', 1)).to eq "Thank you for booking 123 Fake Lane on 2022-02-07!"
    end

    it 'doest not allow to double book the same room' do
      connection = PG.connect(dbname: 'makersbnb_test')
      Room.book(1, '2022-02-07', 1)

      expect(Room.book(1, '2022-02-07', 1)).to eq "Unfortunately, this room is not available on this date!"
    end
  end

end
