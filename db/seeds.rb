# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(:email => 'organizer@procialize.com', :password => 'secret', :password_confirmation => 'secret')
#User.create!(:email => 'ptotem@procialize.com', :password => '123456', :password_confirmation => '123456')
#User.create!(:email => 'organizer@procialize.com', :password => 'secret', :password_confirmation => 'secret')


Attendee.create!(:name => 'Indrajeet Mishra', :user_id => '1')
Attendee.create!(:name => 'Amol Bhor', :user_id => '2')
Attendee.create!(:name => 'Nilesh Panchal', :user_id => '3')
Attendee.create!(:name => 'Rakesh Rengaraj', :user_id => '4')
Attendee.create!(:name => 'Sunny singh', :user_id => '5')



Organizer.create!(:name => 'Ptotem', :user_id => '1')
Organizer.create!(:name => 'Rooters', :user_id => '2')
Organizer.create!(:name => 'Lansing', :user_id => '3')
Organizer.create!(:name => 'Altec', :user_id => '4')
Organizer.create!(:name => 'Emanuel', :user_id => '5')


Profile.create!(:name => 'Indrajeet Mishra', :interest => 'Technology', :user_id => '1')
Profile.create!(:name => 'Amol Bhor', :interest => 'Technology', :user_id => '2')
Profile.create!(:name => 'Nilesh Panchal', :interest => 'Technology', :user_id => '3')
Profile.create!(:name => 'Rakesh Rengaraj', :interest => 'Technology', :user_id => '4')
Profile.create!(:name => 'Sunny singh', :interest => 'Technology', :user_id => '5')


Event.create(:name => 'Project exhibition', :organizer_id => '1',:user_id => '1')
Event.create(:name => 'Technical exhibition', :organizer_id => '2',:user_id => '2')
Event.create(:name => 'Presentation', :organizer_id => '3',:user_id => '3')
Event.create(:name => 'Debate', :organizer_id => '4',:user_id => '4')
Event.create(:name => 'Optimization', :organizer_id => '5',:user_id => '5')

#Event.create(:name => 'Project exhibition', :organizer_id => '1',:start_at =>'2012-12-19 01:00:00',:end_at => '2012-12-19 05:30:00')
#Event.create(:name => 'Technical exhibition', :organizer_id => '2',:start_at =>'2013-01-5 01:00:00',:end_at => '2013-01-6 03:00:00')
#Event.create(:name => 'Presentation', :organizer_id => '3',:start_at =>'2013-01-18 11:00:00',:end_at => '2013-10-19 06:00:00')
#Event.create(:name => 'Debate', :organizer_id => '4',:start_at =>'2013-01-23 07:00:00',:end_at => '2013-10-26 23:00:00')
#Event.create(:name => 'Optimization', :organizer_id => '5',:start_at =>'2012-12-2 18:00:00',:end_at => '2012-12-5 03:00:00')



Meeting.create(:location => 'Mumbai', :meeting_details => 'Exhibition about satellite aspects', :name => 'Satellite Meteorology')
Meeting.create(:location => 'Mumbai', :meeting_details => 'Exhibition about technical aspects', :name => 'Mobile Motors ')
Meeting.create(:location => 'Mumbai', :meeting_details => 'Presentation about Mobile features', :name => 'Mobile log')
Meeting.create(:location => 'Mumbai', :meeting_details => 'Debate on  vehicle enegine', :name => 'Vehicle aspects')
Meeting.create(:location => 'Pune', :meeting_details => 'Presentation about Mobile features', :name => 'Mobile features')

Location.create!(:name => 'Mumbai', :meeting_id => '1')
Location.create!(:name => 'Pune', :meeting_id => '2')
Location.create!(:name => 'Chennai', :meeting_id => '3')
Location.create!(:name => 'Delhi', :meeting_id => '4')
Location.create!(:name => 'Bangalore', :meeting_id => '5')


Message.create(:message_details => 'Mobilable like', :attendee_id => '1', :meeting_id => '5')
Message.create(:message_details => 'Techyy as soon', :attendee_id => '2', :meeting_id => '4')
Message.create(:message_details => 'Presentable', :attendee_id => '3', :meeting_id => '3')
Message.create(:message_details => 'Debate Debate ', :attendee_id => '4', :meeting_id => '2')
Message.create(:message_details => 'Tech watering', :attendee_id => '5', :meeting_id => '1')


EventLocation.create!(:event_id => '1',:location_id => '5')
EventLocation.create!(:event_id => '2',:location_id => '4')
EventLocation.create!(:event_id => '3',:location_id => '3')
EventLocation.create!(:event_id => '4',:location_id => '2')
EventLocation.create!(:event_id => '5',:location_id => '1')

Feedback.create!(:event_id=>'5',:attendee_id=>'1',:feedback_details=>'Bad')
Feedback.create!(:event_id=>'4',:attendee_id=>'2',:feedback_details=>'Good')
Feedback.create!(:event_id=>'3',:attendee_id=>'3',:feedback_details=>'Worse')
Feedback.create!(:event_id=>'2',:attendee_id=>'4',:feedback_details=>'Satisfied')
Feedback.create!(:event_id=>'1',:attendee_id=>'5',:feedback_details=>'Well done')


GrafitiWall.create!(:wall_message => 'Presentation about Mobile features',:attendee_id => '1',:user_id => '5')
GrafitiWall.create!(:wall_message => 'Exhibition about satellite aspects',:attendee_id => '2',:user_id => '4')
GrafitiWall.create!(:wall_message => 'Debate on  vehicle enegine',:attendee_id => '3',:user_id => '3')
GrafitiWall.create!(:wall_message => 'Techyy as soon',:attendee_id => '4',:user_id => '2')
GrafitiWall.create!(:wall_message => 'Presentation about Mobile features',:attendee_id => '5',:user_id => '1')



Broadcast.create!(:event_id => '1',:organizer_id => '5')
Broadcast.create!(:event_id => '2',:organizer_id => '4')
Broadcast.create!(:event_id => '3',:organizer_id => '3')
Broadcast.create!(:event_id => '4',:organizer_id => '2')
Broadcast.create!(:event_id => '5',:organizer_id => '1')



NoticeBoard.create!(:board_message => 'aaaaaaaaaaaa',:broadcast_id => '1',:user_id => '5')
NoticeBoard.create!(:board_message => 'bbbbbbbbbbbb',:broadcast_id => '1',:user_id => '5')
NoticeBoard.create!(:board_message => 'cccccccccccc',:broadcast_id => '1',:user_id => '5')
NoticeBoard.create!(:board_message => 'dddddddddddd',:broadcast_id => '1',:user_id => '5')
NoticeBoard.create!(:board_message => 'eeeeeeeeeeee',:broadcast_id => '1',:user_id => '5')


Deck.create!(:name => 'Indra',:event_id=>'5')
Deck.create!(:name => 'Nilesh',:event_id=>'1')
Deck.create!(:name => 'Kirthi',:event_id=>'3')
Deck.create!(:name => 'Sunny',:event_id=>'2')
Deck.create!(:name => 'Sachin',:event_id=>'4')


Speaker.create!(:name=> 'Sachin',:user_id => '5',:event_id => '1')
Speaker.create!(:name=> 'Nilesh',:user_id => '4',:event_id => '2')
Speaker.create!(:name=> 'Pranay',:user_id => '3',:event_id => '3')
Speaker.create!(:name=> 'Amol', :user_id => '2',:event_id => '4')
Speaker.create!(:name=> 'Ashley',:user_id => '1',:event_id => '5')