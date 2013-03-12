namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'

    Rake::Task['db:reset'].invoke





      100.times do |c|
        user=User.create!(:name =>Faker::Name.name ,
                          :email =>Faker::Internet.email ,
                          :password => "alumnport",
                          :password_confirmation => "alumnport",
                          :headline =>   Faker::Company.name,
                          :educations => Faker::Company.name,)
      end

        # Create entries for test_user's course
        100.times do |e|
          participants = Participant.create!(:user_id => Random.rand(0...User.all.count) + User.first.id,:conference_id => "1")

        end




    conference =Conference.create!(:name => "Alumnport",
                                   :description => "Alumport, an annual celebration of ISB's alumni community, brings together alumni from across the country to take a trip down memory lane, reconnect with their alma mater and relive their fondest memories. The students, faculty and staff at ISB unite to extend a warm welcome to all our alums and provide them with the opportunity to create new and long-lasting bonds with the current class. The three day event is jam packed with exciting events that range from networking and knowledge sharing opportunities to fun, games and entertainment. Alumport provides a platform for the alumni to meet some of the fellow influential people in the corporate world, engage with renowned personalities, and create new bridges between their past lives at ISB and the new road that lies ahead.<br/><br/>Alumport 2012 promises to be bigger and grander than ever before and provide our alums with an experience they would never forget. It marks the homecoming of alumni from the Co 2003 and Co 2008. With the inauguration of the Mohali campus this year we envisage a good turnout of students and alumni as the ISB family comes together to celebrate.<br/><br/>An event of this magnitude would be incomplete without the involvement and presence of the illustrious ISB Alumni Community, Faculty and Staff. We invite you to be an integral part of this momentous occasion where the Class of 2013, will leave no stone unturned to make this event a remarkable experience for each and every one involved." ,
                                   :starting  => "2013-12-21",
                                   :ending => "2013-12-23"


    )



  25.times do |event|
      event = Event.create!(:name => Faker::Name.name,
                            :description =>  Faker::Lorem.paragraph(sentence_count = 3),
                            :start => Random.rand(3.months.ago..Time.now),
                            :end => Random.rand(3.months.ago..Time.now),
                            :event_day_id => 1+rand(3)
      )
    end





    10.times do |location|
      location = Location.create!(:name => Faker::Name.name,
                                  :conference_id => "1"
      )
    end


    15.times do |event_loaction|
      event_loaction = EventLocation.create!(:event_id =>  1+rand(25),
                                            :location_id =>  1+rand(10)
      )


    end

  end
end

