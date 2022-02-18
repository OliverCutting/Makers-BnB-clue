require 'pony'

class Mailer
  def self.registrationconfirmation(email)
    Pony.mail(:to => email,
      :from => 'makersbnb@fake.com',
      :subject => 'Thank you for signing up to MakersBnB',
      :body => 'Thank you for signing up to MakersBnB. You can now create listings and book rooms!')
  end

  def self.listingconfirmation(user_id)
    result = DatabaseConnection.query("SELECT email FROM users WHERE id = $1", [user_id])
    email = result[0]['email']
    Pony.mail(:to => email,
    :from => 'makersbnb@fake.com',
    :subject => 'New Listing',
    :body => 'Thank you for adding a listing to MakersBnB')
  end

  def self.bookingconfirmation(user_id, room_id, date)
    room = DatabaseConnection.query("SELECT address, date FROM rooms JOIN bookings ON (bookings.id=rooms.id) WHERE rooms.id=#{room_id} AND date='#{date}'")
    result = DatabaseConnection.query("SELECT email FROM users WHERE id = $1", [user_id])
    email = result[0]['email']
    Pony.mail(:to => email,
    :from => 'makersbnb@fake.com',
    :subject => 'Booking request sent',
    :body => "Thank you for requesting to book #{room[0]['address']} on #{room[0]['date']} with MakersBnB")
  end
end
