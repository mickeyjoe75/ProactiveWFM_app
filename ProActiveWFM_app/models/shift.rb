require_relative( '../db/sql_runner' )

class Shift

  attr_reader( :label, :shiftdate, :shiftstarttime, :shiftendtime, :shiftduration, :breakstarttime, :breakendtime, :breakduration )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @label = options['label']
    @shiftdate = options['shiftdate']
    @shiftstarttime = options['shiftstarttime']
    @shiftendtime = options['shiftendtime']
    @shiftduration = options['shiftduration']
    @breakstarttime = options['breakstarttime']
    @breakendtime = options['breakendtime']
    @breakduration = options['breakduration']
  end

  def save()
    sql = "INSERT INTO shifts
    (
      label,
      shiftdate,
      shiftstarttime,
      shiftendtime,
      shiftduration,
      breakstarttime,
      breakendtime,
      breakduration
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    RETURNING id"
    values = [@label, @shiftdate, @shiftstarttime, @shiftendtime, @shiftduration, @breakstarttime, @breakendtime, @breakduration]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM shifts"
    results = SqlRunner.run( sql )
    return results.map { |shift| Shift.new( shift ) }
  end

  def self.delete_all()
    sql = "DELETE FROM shifts"
    SqlRunner.run( sql )
  end



end
