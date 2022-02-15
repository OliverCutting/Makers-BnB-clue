class User
  def self.create(email:, password:)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'makersbnb_test')
                 else
                   PG.connect(dbname: 'makersbnb')
                 end

    result = connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{password}');")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.find(id)
    return nil unless id

    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'makersbnb_test')
                 else
                   PG.connect(dbname: 'makersbnb')
                 end

    result = connection.exec_params("SELECT * FROM users WHERE id = $1", [id])
    User.new(result[0]['id'], result[0]['email'])
  end
end
