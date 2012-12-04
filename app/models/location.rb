class Location < ActiveRecord::Base
  attr_accessible :conference_id, :name
  has_many :event_locations, :dependent => :destroy
  has_many :events, :through=>:event_locations
  belongs_to :conference

  rails_admin do
    weight 2
    navigation_label 'Conference Management'
    list do
      field :conference
      field :name
    end
    edit do
      field :conference
      field :name
    end
  end


end
