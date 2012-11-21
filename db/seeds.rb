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


Attendee.create!(:attendee_name => 'Indrajeet Mishra', :user_id => '1')
Attendee.create!(:attendee_name => 'Amol Bhor', :user_id => '2')
Attendee.create!(:attendee_name => 'Nilesh Panchal', :user_id => '3')
Attendee.create!(:attendee_name => 'Rakesh Rengaraj', :user_id => '4')
Attendee.create!(:attendee_name => 'Sunny singh', :user_id => '5')


Organizer.create!(:organizer_name => 'Ptotem', :user_id => '1')
Organizer.create!(:organizer_name => 'Rooters', :user_id => '2')
Organizer.create!(:organizer_name => 'Lansing', :user_id => '3')
Organizer.create!(:organizer_name => 'Altec', :user_id => '4')
Organizer.create!(:organizer_name => 'Emanuel', :user_id => '5')


Profile.create!(:profile_name => 'Indrajeet Mishra', :interest => 'Technology', :user_id => '1')
Profile.create!(:profile_name => 'Amol Bhor', :interest => 'Technology', :user_id => '2')
Profile.create!(:profile_name => 'Nilesh Panchal', :interest => 'Technology', :user_id => '3')
Profile.create!(:profile_name => 'Rakesh Rengaraj', :interest => 'Technology', :user_id => '4')
Profile.create!(:profile_name => 'Sunny singh', :interest => 'Technology', :user_id => '5')


Event.create(:event_name => 'Project exhibition',:event_description => 'Presentation about Mobile features',:event_location => 'Mumbai' ,:organizer_id => '1', :user_id => '1')
Event.create(:event_name => 'Technical exhibition',:event_description => 'Debate on  vehicle enegine',:event_location => 'Pune' ,:organizer_id => '1',  :organizer_id => '2', :user_id => '2')
Event.create(:event_name => 'Presentation',:event_description => 'Exhibition about technical aspects',:event_location => 'Bangalore' ,:organizer_id => '1',  :organizer_id => '3', :user_id => '3')
Event.create(:event_name => 'Debate',:event_description => 'Presentation about Mobile featuresdgffdgdfgfgf',:event_location => 'Chennai' ,:organizer_id => '1',  :organizer_id => '4', :user_id => '4')
Event.create(:event_name => 'Optimization',:event_description => 'Exhibition about satellite aspects',:event_location => 'Thane' ,:organizer_id => '1',  :organizer_id => '5', :user_id => '5')

#Event.create(:name => 'Project exhibition', :organizer_id => '1',:start_at =>'2012-12-19 01:00:00',:end_at => '2012-12-19 05:30:00')
#Event.create(:name => 'Technical exhibition', :organizer_id => '2',:start_at =>'2013-01-5 01:00:00',:end_at => '2013-01-6 03:00:00')
#Event.create(:name => 'Presentation', :organizer_id => '3',:start_at =>'2013-01-18 11:00:00',:end_at => '2013-10-19 06:00:00')
#Event.create(:name => 'Debate', :organizer_id => '4',:start_at =>'2013-01-23 07:00:00',:end_at => '2013-10-26 23:00:00')
#Event.create(:name => 'Optimization', :organizer_id => '5',:start_at =>'2012-12-2 18:00:00',:end_at => '2012-12-5 03:00:00')


Meeting.create(:meeting_name => 'Mobilable like' ,:meeting_location => 'Mumbai', :meeting_description => 'Exhibition about satellite aspects',:user_id => '5')
Meeting.create(:meeting_name => 'Techyy as soon' ,:meeting_location => 'Mumbai', :meeting_description => 'Exhibition about technical aspects', :user_id => '4')
Meeting.create(:meeting_name => 'Presentable' ,:meeting_location => 'Mumbai', :meeting_description => 'Presentation about Mobile features', :user_id => '3')
Meeting.create(:meeting_name => 'Debate Debate' ,:meeting_location => 'Mumbai', :meeting_description => 'Debate on  vehicle enegine', :user_id =>'2')
Meeting.create(:meeting_name => 'Tech watering' ,:meeting_location => 'Pune', :meeting_description => 'Presentation about Mobile features', :user_id => '1')

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


EventLocation.create!(:event_id => '1', :location_id => '5')
EventLocation.create!(:event_id => '2', :location_id => '4')
EventLocation.create!(:event_id => '3', :location_id => '3')
EventLocation.create!(:event_id => '4', :location_id => '2')
EventLocation.create!(:event_id => '5', :location_id => '1')

Feedback.create!(:event_id => '5', :attendee_id => '1', :feedback_details => 'Bad')
Feedback.create!(:event_id => '4', :attendee_id => '2', :feedback_details => 'Good')
Feedback.create!(:event_id => '3', :attendee_id => '3', :feedback_details => 'Worse')
Feedback.create!(:event_id => '2', :attendee_id => '4', :feedback_details => 'Satisfied')
Feedback.create!(:event_id => '1', :attendee_id => '5', :feedback_details => 'Well done')


GrafitiWall.create!(:wall_message => 'Presentation about Mobile features', :attendee_id => '1', :user_id => '5')
GrafitiWall.create!(:wall_message => 'Exhibition about satellite aspects', :attendee_id => '2', :user_id => '4')
GrafitiWall.create!(:wall_message => 'Debate on  vehicle enegine', :attendee_id => '3', :user_id => '3')
GrafitiWall.create!(:wall_message => 'Techyy as soon', :attendee_id => '4', :user_id => '2')
GrafitiWall.create!(:wall_message => 'Presentation about Mobile features', :attendee_id => '5', :user_id => '1')


Broadcast.create!(:event_id => '1', :organizer_id => '5')
Broadcast.create!(:event_id => '2', :organizer_id => '4')
Broadcast.create!(:event_id => '3', :organizer_id => '3')
Broadcast.create!(:event_id => '4', :organizer_id => '2')
Broadcast.create!(:event_id => '5', :organizer_id => '1')


NoticeBoard.create!(:board_messages => 'aaaaaaaaaaaa', :broadcast_id => '1', :user_id => '5')
NoticeBoard.create!(:board_messages => 'bbbbbbbbbbbb', :broadcast_id => '1', :user_id => '5')
NoticeBoard.create!(:board_messages => 'cccccccccccc', :broadcast_id => '1', :user_id => '5')
NoticeBoard.create!(:board_messages => 'dddddddddddd', :broadcast_id => '1', :user_id => '5')
NoticeBoard.create!(:board_messages => 'eeeeeeeeeeee', :broadcast_id => '1', :user_id => '5')


Deck.create!(:deck_name => 'Indra', :event_id => '5')
Deck.create!(:deck_name => 'Nilesh', :event_id => '1')
Deck.create!(:deck_name => 'Kirthi', :event_id => '3')
Deck.create!(:deck_name => 'Sunny', :event_id => '2')
Deck.create!(:deck_name => 'Sachin', :event_id => '4')


Speaker.create!(:speaker_name => 'Sachin', :user_id => '5', :event_id => '1')
Speaker.create!(:speaker_name => 'Nilesh', :user_id => '4', :event_id => '2')
Speaker.create!(:speaker_name => 'Pranay', :user_id => '3', :event_id => '3')
Speaker.create!(:speaker_name => 'Amol', :user_id => '2', :event_id => '4')
Speaker.create!(:speaker_name => 'Ashley', :user_id => '1', :event_id => '5')