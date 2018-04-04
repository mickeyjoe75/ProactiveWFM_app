require_relative( '../db/sql_runner' )

class Shift

  attr_reader( :label, :shiftDate, :shiftStartTime, :shiftEndTime, :shiftDuration, :breakStartTime, :breakEndTime, :breakDuration )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @label = options['label']
    @shiftDate = options['shiftDate']
    @shiftStartTime = options['shiftStartTime']
    @shiftEndTime = options['shiftEndTime']
    @shiftDuration = options['shiftDuration']
    @breakStartTime = options['breakStartTime']
    @breakEndTime = options['breakEndTime']
    @breakDuration = options['breakDuration']
  end

  def save()
    sql = "INSERT INTO shifts
    (
      label,
      shiftDate,
      shiftStartTime,
      shiftEndTime,
      shiftDuration,
      breakStartTime,
      breakEndTime,
      breakDuration
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    RETURNING id"
    values = [@label, @shiftDate, @shiftStartTime, @shiftEndTime, @shiftDuration, @breakStartTime, @breakEndTime, @breakDuration]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM shifts"
    SqlRunner.run( sql )
  end



end
