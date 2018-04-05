require_relative("../models/location.rb" )
require_relative("../models/campaign.rb" )
require_relative("../models/department.rb" )
require_relative("../models/team.rb" )
require_relative("../models/jobtitle.rb" )
require_relative("../models/employee.rb" )
require_relative("../models/shift.rb" )
require("pry-byebug")

Location.delete_all()
Campaign.delete_all()
Department.delete_all()
Team.delete_all()
Jobtitle.delete_all()
Employee.delete_all()
Shift.delete_all()


location1 = Location.new({
  "name" => "Edinburgh"
  })

  location1.save()

  location2 = Location.new({
    "name" => "Glasgow"
  })

  location2.save()

  campaign1 = Campaign.new({
    "name" => "Scottish Gas"
  })

  campaign1.save()

  campaign2 = Campaign.new({
    "name" => "Barclays"
  })

  campaign2.save()

  department1 = Department.new({
    "name" => "Customer Service"
  })

  department1.save()

  department2 = Department.new({
    "name" => "Collections"
  })

  department2.save()

  team1 = Team.new({
    "name" => "Thames"
  })

  team1.save()

  team2 = Team.new({
    "name" => "Clyde"
  })

  team2.save()

  jobtitle1 = Jobtitle.new({
    "title" => "Customer Service Agent",
    "supervisor" => false
  })

  jobtitle1.save()

  jobtitle2 = Jobtitle.new({
    "title" => "Team Leader",
    "supervisor" => true
  })

  jobtitle2.save()

  employee1 = Employee.new({
    "firstname" => "John",
    "surname" => "Smith",
    "email" => "john.smith@scottishgas.co.uk",
    "contractedhrs" => 40,
    "dateofbirth" => '01/09/1980',
    "startdate" => '05/02/2018'
  })

  employee1.save()

  employee2 = Employee.new({
    "firstname" => "Daniel",
    "surname" => "Seaborne",
    "email" => "daniel.seaborne@scottishgas.co.uk",
    "contractedhrs" => 40,
    "dateofbirth" => '05/02/1982',
    "startdate" => '05/02/2018'
  })

  employee2.save()

  employee3 = Employee.new({
    "firstname" => "Bradley",
    "surname" => "Scott",
    "email" => "bradley.scott@scottishgas.co.uk",
    "contractedhrs" => 40,
    "dateofbirth" => '01/05/1978',
    "startdate" => '05/02/2018'
  })

  employee3.save()

  shift1 = Shift.new({
    "label" => "FT-Early",
    "shiftdate" => '01/01/2018',
    "shiftstarttime" => '08:00',
    "shiftendtime" => '16:00',
    "shiftduration" => 8,
    "breakstarttime" => '12:00',
    "breakendtime" => '12:30',
    "breakduration" => 0.5
  })

  shift1.save()
