## This file should contain all the record creation needed to seed the database with its default values.
## The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
##
## Examples:
##
##   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
##   Mayor.create(name: 'Emanuel', city: cities.first)
#
##User.create!(:name=>"Administrator",:email => 'organizer@procialize.com', :password => 'secret', :password_confirmation => 'secret')
#
#
#
User.create!(email: 'amol@ptotem.com', name: 'Amol', password: 'procialize', password_confirmation: 'procialize',:role => 'admin')
