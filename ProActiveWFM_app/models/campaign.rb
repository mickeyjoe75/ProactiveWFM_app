require_relative( '../db/sql_runner' )

class Campaign

  attr_reader( :name, :id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def self.all()
    sql = "SELECT * FROM campaigns"
    results = SqlRunner.run( sql )
    return results.map { |campaign| Location.new( campaign ) }
  end

  def save()
    sql = "INSERT INTO campaigns
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

  def self.delete_all()
    sql = "DELETE FROM campaigns"
    SqlRunner.run( sql )
  end





end
