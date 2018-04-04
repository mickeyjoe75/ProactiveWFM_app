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
    RETURNING id"
    values = [@id, @firstName, @surName, @email, @contractedHrs, @dateOfBirth, @startDate]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM employees"
    SqlRunner.run( sql )
  end




end


# id, firstName, surName, email, contractedHrs, dateOfBirth, startDate
