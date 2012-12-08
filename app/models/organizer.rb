class Organizer < ActiveRecord::Base
  attr_accessible :conference_id, :user_id
  belongs_to :user
  belongs_to :conference

  rails_admin do
      weight 1
      navigation_label 'User Management'
      list do
        field :user
        field :conference
      end
      edit do
        field :user
        field :conference
      end
    end


end
