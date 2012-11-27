# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(:email => 'organizer@procialize.com', :password => 'secret', :password_confirmation => 'secret')



Attendee.create!(:user_id => '1',:event_id => '1' ,:feedback => 'Not good enough,still unable to get the point')
Attendee.create!(:user_id => '2',:event_id => '2' ,:feedback => 'Good enough,to believe')
Attendee.create!(:user_id => '2',:event_id => '3' ,:feedback => 'Refereshing what a presentation good')
Attendee.create!(:user_id => '2',:event_id => '4' ,:feedback => 'Well done guys done a great job')
Attendee.create!(:user_id => '3',:event_id => '1' ,:feedback => 'Amused to see what we can do')
Attendee.create!(:user_id => '3',:event_id => '2' ,:feedback => 'Good enough,still unable to get the point')
Attendee.create!(:user_id => '4',:event_id => '1' ,:feedback => 'Not satisfied')
Attendee.create!(:user_id => '4',:event_id => '2' ,:feedback => 'Goooooood job,well presented')


Conference.create!(:name => 'Ptotem intialising', :description => 'Ptotem initialising the simulation program to have fun',:starting => '2012-11-29',:ending => '2012-11-29')
Conference.create!(:name => 'Presentation about Mobile features', :description => 'Presentation about Mobile features',:starting => '2012-11-30',:ending => '2012-11-30')
Conference.create!(:name => 'Exhibition about satellite aspects', :description => 'Exhibition about technical aspects',:starting => '2012-12-01',:ending => '2012-12-01')
Conference.create!(:name => 'Debate on  vehicle enegine', :description => 'Forty Five Kids, Hot Dogs and Spaghetti',:starting => '2012-12-02',:ending => '2012-12-03')
Conference.create!(:name => 'Presentation about Mobile features', :description => 'Youth MP Mentorship Program for Youth',:starting => '2012-12-04',:ending => '2012-12-04')
Conference.create!(:name => 'Techyy as soon', :description => 'Tech watering',:starting => '2012-12-05',:ending => '2012-12-05')
Conference.create!(:name => 'Ptotem intialising', :description => 'Ptotem initialising the simulation program to have fun',:starting => '2012-12-06',:ending => '2012-12-06')
Conference.create!(:name => 'Ptotem intialising', :description => 'Ptotem simulation program to learn',:starting => '2012-12-07',:ending => '2012-12-07')


EventDay.create!(:name => 'Day one',:conference_id => '1',:sequence => '1')
EventDay.create!(:name => 'Day two',:conference_id => '2',:sequence => '2')
EventDay.create!(:name => 'Day three',:conference_id => '3',:sequence => '3')
EventDay.create!(:name => 'Day four',:conference_id => '1',:sequence => '4')
EventDay.create!(:name => 'Day one',:conference_id => '2',:sequence => '1')
EventDay.create!(:name => 'Day two',:conference_id => '3',:sequence => '2')
EventDay.create!(:name => 'Day one',:conference_id => '1',:sequence => '1')
EventDay.create!(:name => 'Day two',:conference_id => '2',:sequence => '2')


Event.create!(:name => 'Balls of the Bull Festival',:description => 'employers will be scheduling "Late Night Interviews" during the Fair and will conduct them in the Career Center at 185 Student Services Building.',:start => '2012-11-06 09:00:00',:end => '2012-11-06 10:30:00',:event_day_id => '1')
Event.create!(:name => 'Brooklyn Bums Boogie the night away',:description => 'Illinois State education majors and alum seeking internships, and full or part-time positions in the education sector in 2012 are invited to attend this job fair',:start => '2012-11-13 12:00:00',:end => '2012-11-13 05:30:00',:event_day_id => '2')
Event.create!(:name => 'Contortionists Training Camp',:description => 'Attendees should bring resumes and be ready for an on-the-spot interview. Attire for attendees is business professional.',:start => '2012-11-20 10:00:00',:end => '2012-11-20 08:30:00',:event_day_id => '3')
Event.create!(:name => 'Gliding Lights Childrens Fund',:description => 'National Association of Colleges and Employers (NACE) and adheres to the Principles of Professional Conduct for Career Services & Employment Professionals established by that association',:start => '2012-11-14 01:00:00',:end => '2012-11-14 09:00:00',:event_day_id => '4')
Event.create!(:name => 'Jimmy Buffets Granola Fantasy Canteen',:description => 'National Association of Colleges and Employers (NACE) and adheres to the Principles of Professional Conduct for Career Services & Employment Professionals established by that association',:start => '2012-11-10 08:00:00',:end => '2012-11-10 06:30:00',:event_day_id => '5')
Event.create!(:name => 'LP Youth Leadership Program for Youth',:description => 'Everyone: be sure to add the names (with their permission of course) of at least two or three References',:start => '2012-11-08 11:00:00',:end => '2012-11-08 23:00:00',:event_day_id => '6')
Event.create!(:name => 'Mighty Millennium A Bash for 2000',:description => 'Having a good sense of humor is naturally a plus. Maturity, creativity, and integrity will also be on any districts wish list of desired attributes.',:start => '2012-11-21 11:00:00',:end => '2012-11-21 10:30:00',:event_day_id => '7')
Event.create!(:name => 'Youth MP Mentorship Program for Youth',:description => 'Spring Break could be too late, although new listings will of course be advertised through Spring and Summer.',:start => '2012-11-22 01:00:00',:end => '2012-11-22 05:00:00',:event_day_id => '8')

Location.create!(:name => 'Mumbai',:conference_id => '1')
Location.create!(:name => 'Thane',:conference_id => '2')
Location.create!(:name => 'Kalyan',:conference_id => '3')
Location.create!(:name => 'Dombivli',:conference_id => '4')
Location.create!(:name => 'CST',:conference_id => '5')
Location.create!(:name => 'Wadala',:conference_id => '6')
Location.create!(:name => 'Dadar',:conference_id => '7')
Location.create!(:name => 'Malad',:conference_id => '8')

EventLocation.create!(:event_id => '1',:location_id => '1')
EventLocation.create!(:event_id => '2',:location_id => '2')
EventLocation.create!(:event_id => '3',:location_id => '3')
EventLocation.create!(:event_id => '4',:location_id => '4')
EventLocation.create!(:event_id => '5',:location_id => '5')
EventLocation.create!(:event_id => '6',:location_id => '6')
EventLocation.create!(:event_id => '7',:location_id => '7')
EventLocation.create!(:event_id => '8',:location_id => '8')

Deck.create!(:event_id => '1')
Deck.create!(:event_id => '2')
Deck.create!(:event_id => '3')
Deck.create!(:event_id => '4')
Deck.create!(:event_id => '5')
Deck.create!(:event_id => '6')
Deck.create!(:event_id => '7')
Deck.create!(:event_id => '8')


Meeting.create!(:name => 'Mobilable like',:location => 'Mumbai',:start_time => '2012-12-19 01:00:00',:end_time => '2012-12-19 05:30:00')
Meeting.create!(:name => 'Techyy as soon',:location => 'Pune',:start_time => '2012-12-02 18:00:00',:end_time => '2012-12-5 03:00:00')
Meeting.create!(:name => 'Tech watering',:location => 'Kalyan',:start_time => '2013-01-5 01:00:00',:end_time => '2013-01-5 01:00:00')
Meeting.create!(:name => 'Presentable',:location => 'Dombivli',:start_time => '2013-01-5 01:00:00',:end_time => '2013-01-5 01:00:00')
Meeting.create!(:name => 'Debate Debate',:location => 'Thane',:start_time => '2013-01-5 01:00:00',:end_time => '2013-01-5 01:00:00')
Meeting.create!(:name => 'Exhibition about satellite aspects',:location => 'Dadar',:start_time => '2013-01-5 01:00:00',:end_time => '2013-01-5 01:00:00')
Meeting.create!(:name => 'Debate on  vehicle enegine',:location => 'Wadala',:start_time => '2013-01-5 01:00:00',:end_time => '2013-01-5 01:00:00')
Meeting.create!(:name => 'Presentation about Mobile features',:location => 'Malad',:start_time => '2013-01-5 01:00:00',:end_time => '2013-01-5 01:00:00')

