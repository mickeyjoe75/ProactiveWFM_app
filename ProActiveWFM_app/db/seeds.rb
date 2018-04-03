require_relative("../models/location.rb" )
require_relative("../models/organisation.rb" )
require_relative("../models/department.rb" )
require("pry-byebug")


Location.delete_all()
Organisation.delete_all()

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
