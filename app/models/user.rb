class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :provider, :uid, :name, :location, :industry, :picture, :token, :secret, :headline, :avatar
  has_attached_file :avatar

  def self.find_for_linkedin_oauth(auth, signed_in_resource=nil)
    require "open-uri"
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(provider:auth.provider, uid:auth.uid, email:auth.info.email, password:Devise.friendly_token[0, 20], name:auth.info.name, location:auth.info.location, industry:auth.info.industry, picture:auth.info.image, token:auth.credentials.token, secret:auth.credentials.secret, headline:auth.info.headline  )
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

end
