require_relative("../models/location.rb" )
require_relative("../models/organisation.rb" )
require_relative("../models/department.rb" )
require_relative("../models/team.rb" )
require_relative("../models/jobtitle.rb" )
require("pry-byebug")


Location.delete_all()
Organisation.delete_all()
Department.delete_all()
Team.delete_all()

location1 = Location.new({
  "name" => "Edinburgh"
  })

  location1.save()

  location2 = Location.new({
    "name" => "Glasgow"
  })

  location2.save()

  organisation1 = Organisation.new({
    "name" => "Scottish Gas"
  })

  organisation1.save()

  organisation2 = Organisation.new({
    "name" => "Barclays"
  })

  organisation2.save()

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
