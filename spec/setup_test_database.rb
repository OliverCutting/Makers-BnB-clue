require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE users, bookings, rooms RESTART IDENTITY;")
end

def populate_database
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("INSERT INTO users (email, password) VALUES ('fakeuser@email.com', 'fakepassword');")
  connection.exec("INSERT INTO rooms (address, start_date, end_date, owner_id) VALUES ('123 Fake Lane', '2022-02-05', '2022-02-10', 1);")
  connection.exec("INSERT INTO rooms (address, start_date, end_date, owner_id) VALUES ('321 Fake Lane', '2022-02-05', '2022-02-10', 1);")
end
