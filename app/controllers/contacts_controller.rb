class ContactsController < ApplicationController


  def new
    @message = Message.new
    @users=[]
    @followed=Follower.find_all_by_user_id(current_user.id).map { |f| User.find(f.follower_id) }
    @users<<@followed
    @users<<(User.all - @followed)
    @user_list=@users.flatten.map { |u| [u.name.titlecase, u.id] }
    @use=@users.flatten.select { |u| (u.email=="vineet.dagar@i2ieventsgroup.com") }.map { |u| u.name }
  end


  # Contact Us message to the concerned person
  def create
    @message = Message.new(params[:message])
    @message.save
    @receipient=Receipient.create!(:user_id => 170, :message_id => @message.id)
    @receipient.status=nil
    @receipient.save

    respond_to do |format|
      if @message.save


        format.html { redirect_to root_path, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

end
