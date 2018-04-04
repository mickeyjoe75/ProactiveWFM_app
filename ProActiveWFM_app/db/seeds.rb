require_relative("../models/location.rb" )
require_relative("../models/campaign.rb" )
require_relative("../models/department.rb" )
require_relative("../models/team.rb" )
require_relative("../models/jobtitle.rb" )
require_relative("../models/employee.rb" )
require("pry-byebug")


Location.delete_all()
Campaign.delete_all()
Department.delete_all()
Team.delete_all()
Jobtitle.delete_all()
Employee.delete_all()


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
    "firstName" => "John",
    "surName" => "Smith",
    "email" => "john.smith@scottishgas.co.uk",
    "contractedHrs" => 40,
    "dateOfBirth" => '01/09/1980',
    "startDate" => '05/02/2018'
  })

  employee1.save()
