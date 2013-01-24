class Questionable < ActiveRecord::Base
  attr_accessible :approved, :down_votes, :event_id, :quest_name, :up_votes, :user_id

  belongs_to :event


  #rails_admin do
  #  weight 6
  #  navigation_label 'Conference Management'
  #  list do
  #    field :approved
  #    field :down_votes
  #    field :event_id
  #    field :quest_name
  #    field :up_votes
  #    field :user_id
  #  end
  #  edit do
  #    field :approved
  #    field :down_votes
  #    field :event_id
  #    field :quest_name
  #    field :up_votes
  #    field :user_id
  #
  #  end
  #end

end
