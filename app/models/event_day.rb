class EventDay < ActiveRecord::Base
  attr_accessible :conference_id, :name, :sequence
  has_many :events, :dependent => :destroy
  belongs_to :conference

  rails_admin do
    weight 1
    navigation_label 'Conference Management'
    list do
      field :conference
      field :sequence do
        label "Day Number"
      end
      field :name
    end
    edit do
      field :conference
      field :sequence do
        label "Day Number"
      end
      field :name
    end
  end

end
