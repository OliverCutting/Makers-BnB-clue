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
    p email
    Pony.mail(:to => email,
    :from => 'makersbnb@fake.com',
    :subject => 'New Listing',
    :body => 'Thank you for adding a listing to MakersBnB')
  end


end
