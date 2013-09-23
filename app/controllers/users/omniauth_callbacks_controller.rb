class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkedin
    if user_signed_in?
      #render :json =>
      #return
      @user = current_user
      @user.name = "#{request.env["omniauth.auth"]["extra"]["raw_info"]["firstName"]} #{request.env["omniauth.auth"]["extra"]["raw_info"]["lastName"]}"
      @user.industry = request.env["omniauth.auth"]["extra"]["raw_info"]["industry"]
      @user.headline = request.env["omniauth.auth"]["extra"]["raw_info"]["headline"]
      @user.educations = "#{request.env["omniauth.auth"]["extra"]["raw_info"]["educations"]["values"][0]["fieldOfStudy"]}, #{request.env["omniauth.auth"]["extra"]["raw_info"]["educations"]["values"][0]["schoolName"]}"
      @user.location = request.env["omniauth.auth"]["extra"]["raw_info"]["location"]["name"]
      @user.skills = request.env["omniauth.auth"]["extra"]["raw_info"]["skills"]["values"].map{|i| i["skill"]["name"]}.to_s.gsub(/"/,'').gsub("[",'').gsub("]",'') rescue ''
      @user.interest = request.env["omniauth.auth"]["extra"]["raw_info"]["interests"]
      @user.picture = "#{request.env["omniauth.auth"]["extra"]["raw_info"]["pictureUrl"].to_s}"

      @user.save!
      if params[:desktop]
       redirect_to delegate_profile_index_path(@user) and return
      else
        redirect_to user_profile_path(@user) and return
      end
    else
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.find_for_linkedin_oauth(request.env["omniauth.auth"], current_user)
      if @user.persisted?
        sign_in_and_redirect @user, :events => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Linkedin") if is_navigational_format?
      else
        session["devise.linkedin_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  end


  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end