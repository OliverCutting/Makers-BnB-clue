require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE rooms RESTART IDENTITY;")
end

def populate_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("INSERT INTO rooms (address) VALUES ('123 Fake Lane');")
end
