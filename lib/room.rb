require 'pg'

class Room

  def self.list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT * FROM rooms")
    result.map do |room|
      room['address']
    end
  end

  def self.create(address)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("INSERT INTO rooms (address) VALUES ('#{address}');")
  end

  def self.availability(rooms)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT available FROM rooms")
    result.map do |availability|
      availability['available']

      if availability == true
        "Thank you for booking!"
      else
        raise "Unfortunately, this room is not available!"
      end
    end
  end
end
