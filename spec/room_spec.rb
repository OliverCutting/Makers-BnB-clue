require 'room'

describe Room do
  describe '.list' do
    it 'posts all rooms' do
      rooms = Room.list
      expect(rooms.first.address).to eq('123 Fake Lane')
    end
  end

  describe '.create' do
    it 'creates a new room' do
      Room.create('321 Lane Fake', '3 storey treehouse with open fire', '£200', '2022-02-05', '2022-02-10', 1)
      rooms = Room.list
      expect(rooms.last.address).to eq('321 Lane Fake')
    end
  end

  describe '.book' do
    it 'allows the user to book the room' do
      expect(Room.book(1, '2022-02-07', 1)).to eq "Thank you for requesting to book 123 Fake Lane on 2022-02-07! The lister will now review your request"
    end

    it 'doest not allow to double book the same room' do
      Room.book(1, '2022-02-07', 1)

      expect(Room.book(1, '2022-02-07', 1)).to eq "Unfortunately, this room is not available on this date!"
    end

    it 'cannot book outside of available dates' do
      expect(Room.book(1, '2022-03-10', 1)).to eq "Error: Chosen date is outside of available dates"
    end
  end

end
