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

  def self.book(addr)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    
    result = connection.exec("UPDATE rooms SET available = FALSE WHERE address = '#{addr}' and available = TRUE;")
   
    if result.cmd_tuples > 0
      "Thank you for booking!"
    else 
      "Unfortunately, this room is not available!"
    end
  end
end

