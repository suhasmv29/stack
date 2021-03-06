class AnswersController < ApplicationController
  before_action :set_answer, only: %i[show edit update destroy  upvote downvote]
  before_action :require_user, except: %i[index]
  before_action :authorize_user, only: %i[edit update destroy show]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    redirect_to root_path
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit; end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = params[:id]
    # @question = Question.all
    @answer.question_id = session[:question_id]
    @answer.save
    redirect_to root_path
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def answer_params
    params.require(:answer).permit(:body, :question_id, :user_id)
  end

  # To restrict the unauthorized users from editing and manupulating the data
  def authorize_user
    id = Answer.find(params[:id]).user_id
    redirect_to root_path if id != current_user.id
  end
end
