class MessagesController < ApplicationController
  def index

    @unread = Receipient.find_all_by_user_id_and_status(current_user.id, nil).map { |r| r.message }.reverse
    @read = Receipient.find_all_by_user_id_and_status(current_user.id, true).map { |r| r.message }.reverse
    @sent = Message.find_all_by_user_id(current_user.id).last(10).reverse

  end

  def show

    @message = Message.find(params[:id])
    @sent = Message.find_all_by_user_id(current_user.id).last(10).reverse
    if @receipient=Receipient.find_by_user_id_and_message_id(current_user.id, @message.id)
      @receipient.status=true
      @receipient.save
    end
    render :layout => 'message_show'
  end

  def new
    @message = Message.new
    @users=[]
    @followed=Follower.find_all_by_user_id(current_user.id).map { |f| User.find(f.follower_id) }
    @users<<@followed
    @users<<(User.all - @followed)
    #@user_list=@users.flatten.map { |u| [u.name.titlecase, u.id] }

    @user_list=@users.flatten.map { |u| [u.name.titlecase, u.id]-[current_user.name ,current_user.id] }

  end

  def focussed_new
    @message = Message.new
    @receipient = params[:id]
    @all=false
    @last_message=nil
    unless params[:message].blank?
      @last_message=Message.find(params[:message])
      unless params[:all].blank?
        @receipients=@last_message.receipients.map { |r| r.user.id }
        @all=true
      end
    end
    @users=[]
    @followed=Follower.find_all_by_user_id(current_user.id).map { |f| User.find(f.follower_id) }
    @users<<@followed
    @users<<(User.all - @followed)
    #@user_list=@users.flatten.map { |u| [u.name.titlecase, u.id] }
    @user_list=@users.flatten.map { |u| [u.name.titlecase, u.id]-[current_user.name ,current_user.id] }
  end

  def edit
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(params[:message])
    respond_to do |format|
      if @message.save

        params[:receipient_users].each do |uid|
          Receipient.create!(:message_id => @message.id, :user_id => uid)
          @invitee=Invitee.create!(:name=>User.find(uid).name, :email=>User.find(uid).email)
          UserMailer.msg_confirmation(@invitee).deliver
        end
        format.html { redirect_to messages_path , :notice=> 'Message was successfully sent.' }
        #format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render :action=> "new" }
        format.json { render :json=> @message.errors, :status=> :unprocessable_entity }
      end
    end
  end

  def message_new_user
    render :text =>  params[:receipient_users][0]
  end



  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, :notice =>'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action=> "edit" }
        format.json { render :json=> @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

end

