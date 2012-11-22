class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @user=current_user
    @name=@user.name
    @photo=@user.picture
    @headline=@user.headline
    @ev=Event.find_by_user_id(@user).id
    @attendee=Attendee.find_by_user_id(@user).id
    @events = Event.all
    #@event_name = Event.find_by_user_id(@user).event_name
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @user=current_user
    @ev=Event.find_by_user_id(@user).id
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @user=current_user
    @ev=Event.find_by_user_id(@user).id
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @user=current_user
    @ev=Event.find_by_user_id(@user).id
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    #render :text=>params
    #return
    @user=current_user

    @ev=Event.find_by_user_id(@user).id
    @event = Event.new(params[:event])

    @start_at=params[:event]["start_at(1i)"]+'-'+ @start_at=params[:event]["start_at(2i)"]+'-'+@start_at=params[:event]["start_at(3i)"]+' '+@start_at=params[:event]["start_at(4i)"]+':'+@start_at=params[:event]["start_at(5i)"]
    @end_at=params[:event]["end_at(1i)"]+'-'+ @end_at=params[:event]["end_at(2i)"]+'-'+@end_at=params[:event]["end_at(3i)"]+' '+@end_at=params[:event]["end_at(4i)"]+':'+@end_at=params[:event]["end_at(5i)"]



        #render :text => @start_at
    #return
    @event = Event.create(:event_name =>params[:event][:event_name] ,:event_description => params[:event][:event_description],:event_location => params[:event][:event_location] , :user_id => @user.id,:start_at => @start_at,:end_at => @end_at)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    #render :text=>params[:event][:start_at]
    #return
    @user=current_user

    @ev=Event.find_by_user_id(@user).id
    @event = Event.find(params[:id])
    @event.complete

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
