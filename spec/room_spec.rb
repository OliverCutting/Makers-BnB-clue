require 'room'

describe Room do
  describe '.list' do
    it 'posts all rooms' do
      connection = PG.connect(dbname: 'makersbnb_test')
      expect(Room.list).to include('123 Fake Lane')
    end
  end

  describe '.create' do
    it 'creates a new room' do
      connection = PG.connect(dbname: 'makersbnb_test')
      Room.create('321 Lane Fake')
      expect(Room.list).to include ('321 Lane Fake')
    end
  end

  describe '.availability' do
    it 'checks the room availability' do
      connection = PG.connect(dbname: 'makersbnb_test')
      Room.create('321 Lane Fake')
      expect(Room.availability('321 Lane Fake')).to eq false
    end
  end
end
