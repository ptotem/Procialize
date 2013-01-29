class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :provider, :uid, :name, :location, :industry, :picture, :token, :secret, :headline, :positions, :educations, :avatar, :batchie
  serialize :positions
  serialize :educations

  has_attached_file :avatar

  has_many :followers, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  has_many :meeters, :dependent => :destroy
  has_many :meetings, :through => :meeters
  has_many :posts, :dependent => :destroy
  has_many :attendees, :dependent => :destroy
  #has_many :events,:through => :attendees
  has_many :speakers, :dependent => :destroy
  has_one :organizer, :dependent => :destroy
  has_many :participants, :dependent => :destroy
  has_many :statuses, :dependent => :destroy
  has_many :receipients, :dependent => :destroy
  has_many :user_locations, :dependent => :destroy
  has_one  :rating,:dependent => :destroy


  def self.find_for_linkedin_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(provider: auth.provider, uid: auth.uid, email: auth.info.email, password: Devise.friendly_token[0, 20], name: auth.info.name, location: auth.info.location, picture: auth.info.image, token: auth.credentials.token, secret: auth.credentials.secret, headline: auth.info.headline, industry: auth.info.industry, positions: auth.extra.raw_info.positions, educations: auth.extra.raw_info.educations)
      user.educations.values[1].each do |t|
        if t.schoolName=="Indian School of Business"
          if !t.endDate.blank?
            user.batchie = "Class of #{t.endDate.year}"
          elsif t.startDate=="2012"
            user.batchie = "Class of 2013"
          else
            user.batchie = "ISB Student. Unknown Class"
          end
        else
          "Not from ISB"
        end
        user.save
      end
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.linkedin_data"] && session["devise.linkedin_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  rails_admin do
    weight 1
    navigation_label 'User Management'
  end
end