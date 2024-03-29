class Event < ActiveRecord::Base
  attr_accessible :description, :end, :event_day_id, :name, :start, :avatar, :locations_attributes

  has_many :decks, :dependent => :destroy
  has_many :attendees, :dependent => :destroy
  has_many :event_locations, :dependent => :destroy
  has_many :speakers, :dependent => :destroy
  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  has_many :locations, :through => :event_locations
  accepts_nested_attributes_for :locations, :reject_if => proc { |attrs| reject = %w(name).all? { |a| attrs[a].blank? } }, :allow_destroy => true

  belongs_to :event_day

  rails_admin do
    weight 3
    navigation_label 'Conference Management'
    list do
      field :event_day
      field :name
      field :start do
        formatted_value do # used in form views
          value.strftime("%I:%M%p") unless value.blank?
        end
      end
      field :end do
        formatted_value do # used in form views
          value.strftime("%I:%M%p") unless value.blank?
        end
      end
    end
    edit do
      field :event_day
      field :name
      field :start
      field :end
      field :description
      field :avatar
      field :locations
    end
  end

end
