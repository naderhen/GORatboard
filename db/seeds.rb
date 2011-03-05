# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


puts 'SETTING UP DEFAULT ROLES'
role1 = Role.create! :name=>"Admin"
puts 'New role created: ' << role1.name
role2 = Role.create! :name=>"Salesperson"
puts 'New role created: ' << role2.name
role3 = Role.create! :name=>"Observer"
puts 'New role created: ' << role3.name
role4 = Role.create! :name=>"Shipper"
puts 'New role created: ' << role4.name


