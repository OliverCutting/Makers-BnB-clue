require 'room'

describe Room do
  describe '.list' do
    it 'posts all rooms' do
      PG.connect(dbname: 'makersbnb_test')
      expect(Room.list).to include('123 Fake Lane')
    end
  end

  describe '.create' do
    it 'creates a new room' do
      PG.connect(dbname: 'makersbnb_test')
      Room.create('321 Lane Fake')
      expect(Room.list).to include('321 Lane Fake')
    end
  end

  describe '.book' do
    it 'allows the user to book the room' do
      connection = PG.connect(dbname: 'makersbnb_test')
      Room.create('321 Lane Fake')
      expect(Room.book('321 Lane Fake')).to eq "Thank you for booking!"
    end

    it 'doest not allow to double book the same room' do
      connection = PG.connect(dbname: 'makersbnb_test')
      Room.create('321 Lane Fake')
      Room.book('321 Lane Fake')

      expect(Room.book('321 Lane Fake')).to eq "Unfortunately, this room is not available!"
    end
  end

end
