require_relative( '../db/sql_runner' )

class Employee

  attr_reader( :id, :firstName, :surName, :email, :contractedHrs, :dateOfBirth, :startDate )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @firstName = options['firstName']
    @surName = options['surName']
    @email = options['email']
    @contractedHrs = options['contractedHrs']
    @dateOfBirth = options['dateOfBirth']
    @startDate = options['startDate']
  end

  def save()
    sql = "INSERT INTO employees
    (
      firstName,
      surName,
      email,
      contractedHrs,
      dateOfBirth,
      startDate
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING *"
    values = [@firstName, @surName, @email, @contractedHrs, @dateOfBirth, @startDate]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def full_name()
    return "#{@firstName} #{@surName}"
  end


  def self.all()
    sql = "SELECT * FROM employees"
    results = SqlRunner.run( sql )
    return results.map { |emp| Employee.new( emp ) }
  end

  def self.delete_all()
    sql = "DELETE FROM employees"
    SqlRunner.run( sql )
  end

  def self.find( id )
    sql = " SELECT * FROM employees
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Employee.new( results.first)
  end

  def shifts()
    sql = "SELECT * FROM shifts
      INNER JOIN employees
      ON employees.shiftId = shifts.id
      WHERE employees.id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |shift| Shift.new(shift) }
  end

  # def employees()
  #   sql = "SELECT * FROM employees
  #     INNER JOIN shifts
  #     ON employees.shiftId = shifts.id
  #     WHERE employees.id = $1;"
  #   values = [@id]
  #   results = SqlRunner.run(sql, values)
  #   return results.map { |emp| Employee.new(emp) }
  # end





end
