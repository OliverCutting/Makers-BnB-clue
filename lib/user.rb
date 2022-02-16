require 'database_connection'
require 'user'
require 'bcrypt'

class User
  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query(
      "INSERT INTO users (email, password) VALUES($1, $2) RETURNING id, email",
      [email, encrypted_password]
    )
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    User.new(
      id: result[0]['id'], email: result[0]['email']
    )
  end

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE email = $1",
      [email]
    )
    User.new(id: result[0]['id'], email: result[0]['email'])
  end
end


# require 'database_connection'

# class User
#   def self.create(email:, password:)
#     connection = if ENV['ENVIRONMENT'] == 'test'
#                    PG.connect(dbname: 'makersbnb_test')
#                  else
#                    PG.connect(dbname: 'makersbnb')
#                  end

#     result = connection.exec_params("INSERT INTO users (email, password) VALUES($1, $2);", [email, password])
#     User.new(id: result[0]['id'], email: result[0]['email'])
#   end

#   attr_reader :id, :email

#   def initialize(id:, email:)
#     @id = id
#     @email = email
#   end

#   def self.find(id)
#     return nil unless id

#     connection = if ENV['ENVIRONMENT'] == 'test'
#                    PG.connect(dbname: 'makersbnb_test')
#                  else
#                    PG.connect(dbname: 'makersbnb')
#                  end

#     result = connection.exec_params("SELECT * FROM users WHERE id = $1", [id])
#     User.new(result[0]['id'], result[0]['email'])
#   end
# end    