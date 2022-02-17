require 'pony'

class Mailer
  def self.registrationconfirmation(email)
    Pony.mail(:to => email,
      :from => 'makersbnb@fake.com',
      :subject => 'Thank you for signing up to MakersBnB',
      :body => 'Thank you for signing up to MakersBnB. You can now create listings and book rooms!')
  end
end
