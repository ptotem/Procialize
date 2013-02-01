class QuestionablesController < ApplicationController
  # GET /questionables
  # GET /questionables.json
  #load_and_authorize_resource


  def index

    @user=current_user
    if params[:id].blank?
      @events=Questionable.all.map { |i| i.event_id }.uniq
    else
      @event=Event.find(params[:id]).id
      @events=Array.new
      @events<<@event
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

  def create_question

    @user=current_user
    #@event = Event.find(params[:event_id])
    @event=Questionable.create(:event_id => params[:questionable][:event_id], :quest_name => params[:questionable][:quest_name], :user_id => @user.id, :approved => false)
    redirect_to :action => "ask_question"


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

    #respond_to do |format|
    #  format.html { redirect_to questionables_url }
    #  format.json { head :no_content }
    #end
  end

  def question_view
    @event=Event.find(44)
    @events=Questionable.all.map { |i| i.event_id }.uniq
  end


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
      @events=Questionable.all.map { |i| i.event_id }.uniq
    else
      @event=Event.find(params[:id])
      @events=Array.new
      @events<<@event
    end

    render :layout => false
  end


  def ask_question
    @user=current_user
    @events=Event.all


    #redirect_to event_path(@event)
    if (!@event.nil?)
      @event = Event.find(params[:event_id])
    end

    if (!@questionable.nil?)
      @questionable = @event.questionables.create(params[:questionable])
    end
  end
end
