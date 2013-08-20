class ContactsController < ApplicationController


  #def index
  #  @unread = Receipient.find_all_by_user_id_and_status(current_user.id, nil).map { |r| r.message }
  #  @read = Receipient.find_all_by_user_id_and_status(current_user.id, true).map { |r| r.message }
  #  @sent = Message.find_all_by_user_id(current_user.id)
  #end

def new
  @message = Message.new
  @users=[]
  @followed=Follower.find_all_by_user_id(current_user.id).map { |f| User.find(f.follower_id) }
  @users<<@followed
  @users<<(User.all - @followed)
  @user_list=@users.flatten.map { |u| [u.name.titlecase, u.id] }
  @use=@users.flatten.select{|u| (u.email=="stafford_t@yahoo.com")}.map{|u| u.email }

end




  def create
    @message = Message.new(params[:message])
    @message.save
    @receipient=Receipient.create!(:user_id => 1, :message_id => @message.id)
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

#def show
#  @message = Message.find(params[:id])
#  if @receipient=Receipient.find_by_user_id_and_message_id(current_user.id, @message.id)
#    @receipient.status=true
#    @receipient.save
#  end
#end



#def edit
#  @message = Message.find(params[:id])
#end
#
#def update
#  @message = Message.find(params[:id])
#
#  respond_to do |format|
#    if @message.update_attributes(params[:message])
#      format.html { redirect_to @message, notice: 'Message was successfully updated.' }
#      format.json { head :no_content }
#    else
#      format.html { render action: "edit" }
#      format.json { render json: @message.errors, status: :unprocessable_entity }
#    end
#  end
#end
#
#
#def destroy
#  @message = Message.find(params[:id])
#  @message.destroy
#
#  respond_to do |format|
#    format.html { redirect_to contacts_url }
#    format.json { head :no_content }
#  end
#end

end
