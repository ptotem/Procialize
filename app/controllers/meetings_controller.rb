class MeetingsController < ApplicationController
  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
    @user = current_user
    @pending = Meeter.find_all_by_user_id_and_status(current_user.id, nil).map { |r| r.meeting }
    @accepted = Meeter.find_all_by_user_id_and_status(current_user.id, true).map { |r| r.meeting }
    @decline = Meeter.find_all_by_user_id_and_status(current_user.id, false).map { |r| r.meeting }
    @sent = Meeting.find_all_by_user_id(@user.id)

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @meetings }
    #end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @meeting = Meeting.find(params[:id])
    if @meeter=Meeter.find_by_user_id_and_meeting_id(current_user.id, @meeting.id)
      @meeter.status=true
      @meeter.save
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meeting }
    end
  end

  # GET /meetings/new
  # GET /meetings/new.json
  def new
    @meeting = Meeting.new
    @users=[]
    @followed=Follower.find_all_by_user_id(current_user.id).map { |f| User.find(f.follower_id) }
    @users<<@followed
    @users<<(User.all - @followed)
    @user_list=@users.flatten.map {|u| [u.name, u.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meeting }
    end
  end

  # GET /meetings/1/edit
  def edit
    @meeting = Meeting.find(params[:id])
  end

  # POST /meetings
  # POST /meetings.json
  def create
    params[:meeting].parse_time_select! :start_time
    @meeting = Meeting.new(params[:meeting])
    respond_to do |format|
      if @meeting.save
        params[:meeter_users].each do |uid|
          Meeter.create!(:meeting_id => @meeting.id, :user_id => uid)
        end
        format.html { redirect_to meetings_path, notice: 'Meeting was successfully created.' }
        format.json { render json: @meeting, status: :created, location: @meeting }
      else
        format.html { render action: "new" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meetings/1
  # PUT /meetings/1.json
  def update
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to meetings_url }
      format.json { head :no_content }
    end
  end

  def accept
    @meeting=Meeting.find(params[:id])
    @meeter=current_user
    @meeter.status=true
    @meeter.save
    redirect_to meetings_path
  end

  def decline
    @meeting=Meeting.find(params[:id])
    @meeter=current_user
    @meeter.status=false
    @meeter.save
    redirect_to meetings_path
  end

end
