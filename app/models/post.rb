class Post < ActiveRecord::Base
  attr_accessible :conference_id, :name, :user_id

  belongs_to :user
  belongs_to :conference

  rails_admin do
      weight 1
      navigation_label 'Post Management'
      list do
        field :user
        field :name
      end
      edit do
        field :name
      end
    end


end
