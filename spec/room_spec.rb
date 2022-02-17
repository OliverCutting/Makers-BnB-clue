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
      Room.create('321 Lane Fake', '3 storey treehouse with open fire', '£200')
      rooms = Room.list
      expect(rooms.last.address).to eq('321 Lane Fake')
    end
  end

  describe '.book' do
    it 'asks to confirm the booking' do
      Room.create('321 Lane Fake', '3 storey treehouse with open fire', '£200') 
      expect(Room.book('321 Lane Fake')).to eq "Please confirm booking!"
    end
  end

  describe '.approve' do
    it 'allows the user to book the room' do
      connection = PG.connect(dbname: 'makersbnb_test')
      Room.create('321 Lane Fake', '3 storey treehouse with open fire', '£200')
      expect(Room.approve('321 Lane Fake')).to eq "Thanks for booking!"
    end

    it 'doest not allow to double book the same room' do
      connection = PG.connect(dbname: 'makersbnb_test')
      Room.create('321 Lane Fake', '3 storey treehouse with open fire', '£200')
      Room.approve('321 Lane Fake')

      expect(Room.approve('321 Lane Fake')).to eq "Unfortunately, this room is not available!"
    end
  end

end
