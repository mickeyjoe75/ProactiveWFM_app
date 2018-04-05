require_relative( '../db/sql_runner' )
require('pry')

class Employee

  attr_reader( :id, :firstname, :surname, :email, :contractedhrs, :dateofbirth, :startdate )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @firstname = options['firstname']
    @surname = options['surname']
    @email = options['email']
    @contractedHrs = options['contractedhrs']
    @dateofbirthfBirth = options['dateofbirth']
    @startdate = options['startdate']
  end

  def save()
    sql = "INSERT INTO employees
    (
      firstname,
      surname,
      email,
      contractedhrs,
      dateofbirth,
      startdate
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING *"
    values = [@firstname, @surname, @email, @contractedhrs, @dateofbirth, @startdate]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def full_name()
    return "#{@firstname} #{@surname}"
  end


  def self.all()
    sql = "SELECT * FROM employees"
    results = SqlRunner.run( sql )
    return results.map { |employee| Employee.new( employee ) }
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







end
