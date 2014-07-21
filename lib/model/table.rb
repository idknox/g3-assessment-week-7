require 'gschool_database_connection'

class Table

  def initialize
    @database_connection = GschoolDatabaseConnection::DatabaseConnection.establish(ENV['RACK_ENV'])
  end

  def add_msg(name, msg)
    @database_connection.sql(
      "INSERT INTO messages (name, msg) VALUES" +
        " ('#{name}', '#{msg}')"
    )
  end

  def get_msg(name=nil)
    if name
      @database_connection.sql(
        "SELECT * from messages WHERE name='#{name}'"
      )[0]
    else
      @database_connection.sql(
        "SELECT * from messages"
      )
    end
  end
end
