class EventDay < ActiveRecord::Base
  attr_accessible :conference_id, :name, :sequence, :event_date
  belongs_to :conference
  has_many :meetings,:dependent => :destroy


  has_many :events, :dependent => :destroy
  has_many :tracks,:through => :events

  rails_admin do
    weight 1
    navigation_label 'Conference Management'
    list do
      field :conference
      field :sequence do
        label "Day Number"
      end
      field :name
      field :event_date
    end
    edit do
      field :conference
      field :sequence do
        label "Day Number"
      end
      field :name
      field :event_date
    end
  end

end
