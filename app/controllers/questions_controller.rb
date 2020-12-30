class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy upvote downvote]

  before_action :require_user, except: %i[show index]

  before_action :authorize_user, only: %i[edit update destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @answers = Answer.where('question_id = :question_id ', { question_id: @question.id })
    session[:question_id] = params[:id]
    @questions = Question.all
    
  end

  def stats
    @answer = Answer.all

    @question = Question.all

    @ans = Answer.where('user_id = :user_id', {user_id: current_user.id}).count

    @question = Question.where('user_id = :user_id', {user_id: current_user.id}).count

    
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit; end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    @question.save

    redirect_to root_path
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def upvote
    # @question.upvote_from current_user
    # redirect_to questions_path

    @question = Question.find(params[:id])
    @question.liked_by current_user

    redirect_to '/'

  end

  def downvote
    # @question.downvote_from current_user
    
    # redirect_to questions_path

    @question = Question.find(params[:id])

    #@question.disliked_by current_user
    @question.disliked_by current_user

    redirect_to '/'
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:title, :body, :answered, :user_id)
  end

  def authorize_user
    id = Question.find(params[:id]).user_id
    redirect_to root_path if id != current_user.id
  end

end
