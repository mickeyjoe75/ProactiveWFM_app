require_relative( '../db/sql_runner' )

class Jobtitle

  attr_reader( :id, :title, :supervisor )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @supervisor = options['supervisor']
  end

  def save()
    sql = "INSERT INTO jobtitles
    (
      title,
      supervisor
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@title, @supervisor]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM jobtitles"
    SqlRunner.run( sql )
  end




end
