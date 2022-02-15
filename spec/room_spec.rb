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
end
