require 'room'

describe Room do
  describe '.list' do
    it 'posts all rooms' do
      connection = PG.connect(dbname: 'makersbnb_test')
      
      expect(Room.list).to include('123 Fake Lane')
    end
  end
end
