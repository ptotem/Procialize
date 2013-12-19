class NoirQuizzesController < ApplicationController
  layout  "application1"

  # GET /noir_quizzes
  # GET /noir_quizzes.json
  def index
    @noir_quizzes = NoirQuiz.all
    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @noir_quizzes }
    #end
    render :layout => "application"
  end

  # GET /noir_quizzes/1
  # GET /noir_quizzes/1.json
  def show
    @noir_quiz = NoirQuiz.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @noir_quiz }
    end
  end

  # GET /noir_quizzes/new
  # GET /noir_quizzes/new.json
  def new
    @noir_quiz = NoirQuiz.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @noir_quiz }
    end
  end

  # GET /noir_quizzes/1/edit
  def edit
    @noir_quiz = NoirQuiz.find(params[:id])
  end

  # POST /noir_quizzes
  # POST /noir_quizzes.json
  def create
    @noir_quiz = NoirQuiz.new(params[:noir_quiz])

    respond_to do |format|
      if @noir_quiz.save
        format.html { redirect_to '/', notice: 'Answer was succesfully recorded.' }
        #format.json { render json: @noir_quiz, status: :created, location: @noir_quiz }
      else
        #format.html { render action: "new" }
        #format.json { render json: @noir_quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /noir_quizzes/1
  # PUT /noir_quizzes/1.json
  def update
    @noir_quiz = NoirQuiz.find(params[:id])

    respond_to do |format|
      if @noir_quiz.update_attributes(params[:noir_quiz])
        format.html { redirect_to @noir_quiz, notice: 'Noir quiz was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @noir_quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noir_quizzes/1
  # DELETE /noir_quizzes/1.json
  def destroy
    @noir_quiz = NoirQuiz.find(params[:id])
    @noir_quiz.destroy
    respond_to do |format|
      format.html { redirect_to noir_quizzes_url }
      format.json { head :no_content }
    end
  end


  def noir_case
    @noir_quiz=NoirQuiz.create(:user_id => params[:user_id][0], :noir_answer => params[:noir_answer][0])
    render :text => @noir_quiz.save
    return
  end

end
