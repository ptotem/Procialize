class QuestionablesController < ApplicationController
  # GET /questionables
  # GET /questionables.json
  #load_and_authorize_resource


  def index
    @user=current_user
    if params[:id].blank?
      #@events=Questionable.all.map { |i| i.event_id }.uniq
      @tracks=Questionable.all.map { |i| i.track_id }.uniq
    else
      #@event=Event.find(params[:id]).id
      #@events=Array.new
      #@events<<@event
      @track=Track.find(params[:id]).id
      @tracks=Array.new
      @tracks<<@track
    end
    #@questionables = Questionable.where(:approved => true).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questionables }
    end
  end


  # GET /questionables/1
  # GET /questionables/1.json
  def show
    @questionable = Questionable.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @questionable }
    end
  end

  # GET /questionables/new
  # GET /questionables/new.json
  def new
    @questionable = Questionable.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @questionable }
    end
  end

  # GET /questionables/1/edit
  def edit
    @questionable = Questionable.find(params[:id])
  end

  # POST /questionables
  # POST /questionables.json
  def create
    #@questionable = Questionable.new(params[:questionable])

    @user=current_user
    @event = Event.find(params[:event_id])
    @questionable = @event.questionables.create(params[:questionable])
    redirect_to event_path(@event)
  end

  def ask_question
    @user=current_user
    @event_days=@conference.event_days
    @event_days = EventDay.all
    @events = Event.all
    @tracks = Track.all
    if (!@track.nil?)
      @track = Track.find(params[:track_id])
    end
    if (!@questionable.nil?)
      @questionable = @track.questionables.create(params[:questionable])
    end
  end



  def create_question
    @user=current_user
    unless params[:questionable].blank?
      @track=Questionable.create(:track_id => params[:question_appending][0], :quest_name => params[:questionable][:quest_name], :user_id => @user.id, :approved => false)
    end
    render :text => @track.save
    return
  end


  # PUT /questionables/1
  # PUT /questionables/1.json
  def update
    @questionable = Questionable.find(params[:id])
    respond_to do |format|
      if @questionable.update_attributes(params[:questionable])
        format.html { redirect_to @questionable, notice: 'Questionable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @questionable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionables/1
  # DELETE /questionables/1.json
  def destroy
    #@questionable = Questionable.find(params[:id])
    #@questionable.destroy
    @event = Event.find(params[:event_id])
    @questionable = @event.questionables.find(params[:id])
    @questionable.destroy
    redirect_to event_path(@event)
  end

  #def question_view
  #  #@event=Event.find(44)
  #  @tracks=Questionable.all.map { |i| i.track_id }.uniq
  #end


  def hide_quest
    @questionable=Questionable.find(params[:question_id][0])
    @questionable.hide=true
    @questionable.save
    render :text => @questionable.id
    return
  end


  def approve_quest
    @questionable=Questionable.find(params[:question_id][0])
    @questionable.approved=true
    @questionable.hide=nil
    @questionable.save
    render :text => @questionable.id
    return
  end


  def unapproved_view
    @events=Questionable.all.map { |i| i.event_id }.uniq
    @unapproved = Questionable.where(:hide => true).all
  end

  def print
    @user=current_user
    if params[:id].blank?
      @tracks=Questionable.all.map { |i| i.track_id }.uniq
    else
      @track=Track.find(params[:id])
      @tracks=Array.new
      @tracks<<@track
    end

    render :layout => false
  end




  def voting
    @questionable=Questionable.find(params[:question_id][0])
    @questionable.like=@questionable.like+1
    @questionable.liking_by=@questionable.liking_by+','+"#{current_user.id}"
    @questionable.save
    render :text => @questionable.like
  end




  def questions_appending
    @quest=Questionable.find_all_by_track_id_and_approved(params[:track_id][0], true)
    @return_data=Array.new
    @quest.each do |i|
      if i.liking_by.include? current_user.id.to_s
        @like_return=1
      else
        @like_return=0
      end
      @return_data<<"#{i.id}|#{i.quest_name}|#{i.user_id}|#{User.find(i.user_id).name}|#{i.like}|#{i.liking_by}|#{@like_return}"
    end
    render :json => @return_data
  end


end


