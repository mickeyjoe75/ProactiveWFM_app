require_relative("../models/location.rb" )
require("pry-byebug")


Location.delete_all()

location1 = Location.new({
  "name" => "Edinburgh"
  })

location1.save()

location2 = Location.new({
    "name" => "Glasgow"
    })

location2.save()
