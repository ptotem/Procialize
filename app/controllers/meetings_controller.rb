class MeetingsController < ApplicationController
  # GET /meetings
  # GET /meetings.json
  def index
    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @attendee=Attendee.find_by_user_id(@user).attendee_name
    @meet=Meeting.find_by_user_id(@user).id
    #@meeting_name=Meeting.meeting_name
    @meetings = Meeting.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meetings }
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @user=current_user
    @meet=Meeting.find_by_user_id(@user).id
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meeting }
    end
  end

  # GET /meetings/new
  # GET /meetings/new.json
  def new
    @user=current_user
    @meet=Meeting.find_by_user_id(@user).id
    @meeting = Meeting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meeting }
    end
  end

  # GET /meetings/1/edit
  def edit
    @user=current_user
    @meet=Meeting.find_by_user_id(@user).id
    @meeting = Meeting.find(params[:id])
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @user=current_user
    @meet=Meeting.find_by_user_id(@user).id
    @meeting = Meeting.new(params[:meeting])
    @meeting = Meeting.create(:meeting_name =>params[:meeting][:meeting_name] ,:meeting_description => params[:meeting][:meeting_description],:meeting_location => params[:meeting][:meeting_location] , :user_id => @user.id)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
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
    @user=current_user
    @meet=Meeting.find_by_user_id(@user).id
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
    @user=current_user
    @meet=Meeting.find_by_user_id(@user).id
    @meeting = Meeting.find(params[:id])
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to meetings_url }
      format.json { head :no_content }
    end
  end
end
