class InviteesController < ApplicationController
  # GET /invitees
  # GET /invitees.json
  def index
    @invitees = Invitee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invitees }
    end
  end

  # GET /invitees/1
  # GET /invitees/1.json
  def show
    @invitee = Invitee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invitee }
    end
  end

  # GET /invitees/new
  # GET /invitees/new.json
  def new
    @invitee = Invitee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invitee }
    end
  end

  # GET /invitees/1/edit
  def edit
    @invitee = Invitee.find(params[:id])
  end

  # POST /invitees
  # POST /invitees.json
  def create
    @invitee = Invitee.new(params[:invitee])

    respond_to do |format|
      if @invitee.save
        UserMailer.registration_confirmation(@invitee).deliver
        format.html { redirect_to root_path,notice: 'Invitation was successfully sent.' }
      end
    end
  end

  # PUT /invitees/1
  # PUT /invitees/1.json
  def update
    @invitee = Invitee.find(params[:id])

    respond_to do |format|
      if @invitee.update_attributes(params[:invitee])
        format.html { redirect_to @invitee, notice: 'Invitee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invitee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invitees/1
  # DELETE /invitees/1.json
  def destroy
    @invitee = Invitee.find(params[:id])
    @invitee.destroy

    respond_to do |format|
      format.html { redirect_to invitees_url }
      format.json { head :no_content }
    end
  end


  def send_mailers

    @rejected = []
    User.all.each do |user|
      @invitee=Invitee.create!(:name=>user.name, :email=>user.email)
      if @invitee.save
        UserMailer.registration_confirmation(@invitee).deliver
        @rejected<<"Ok"
      else
        @rejected<<user.email
      end

    end


    #----------For testing---------------#
   # User.all.each do |user|#

    #user=User.find(447)
    #  @invitee=Invitee.create!(:name=>user.name, :email=>user.email)
    #  if @invitee.save
    #    UserMailer.registration_confirmation(@invitee).deliver
    #    @rejected<<"Ok"
    #  else
    #    @rejected<<user.email
    #  end

    #end

  end


  def send_mailers_recommend

    @recommended_users=User.where(:recommend_select => "t")
    @recommended_users.each do |user|
      @invitee=Invitee.create!(:name=>user.name, :email=>user.email)
      if @invitee.save
        UserMailer.registration_confirmation(@invitee).deliver
        @rejected<<"Ok"
      else
        @rejected<<user.email
      end
    end
  end



end
