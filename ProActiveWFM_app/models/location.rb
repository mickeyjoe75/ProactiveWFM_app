require_relative( '../db/sql_runner' )

class Location

  attr_reader( :id, :name )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO locations
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM locations"
    results = SqlRunner.run( sql )
    return results.map { |location| Location.new( location ) }
  end

  def self.delete_all()
    sql = "DELETE FROM locations"
    SqlRunner.run( sql )
  end

  def update()
    sql = "UPDATE locations
    SET
    (
      name
    ) =
    (
      $1
    )
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end






  end
