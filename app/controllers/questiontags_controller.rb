class QuestiontagsController < ApplicationController
  before_action :set_questiontag, only: [:show, :edit, :update, :destroy]

  # GET /questiontags
  # GET /questiontags.json
  def index
    @questiontags = Questiontag.all
  end

  # GET /questiontags/1
  # GET /questiontags/1.json
  def show
  end

  # GET /questiontags/new
  def new
    @questiontag = Questiontag.new
  end

  # GET /questiontags/1/edit
  def edit
  end

  # POST /questiontags
  # POST /questiontags.json
  def create
    @questiontag = Questiontag.new(questiontag_params)

    respond_to do |format|
      if @questiontag.save
        format.html { redirect_to @questiontag, notice: 'Questiontag was successfully created.' }
        format.json { render :show, status: :created, location: @questiontag }
      else
        format.html { render :new }
        format.json { render json: @questiontag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questiontags/1
  # PATCH/PUT /questiontags/1.json
  def update
    respond_to do |format|
      if @questiontag.update(questiontag_params)
        format.html { redirect_to @questiontag, notice: 'Questiontag was successfully updated.' }
        format.json { render :show, status: :ok, location: @questiontag }
      else
        format.html { render :edit }
        format.json { render json: @questiontag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questiontags/1
  # DELETE /questiontags/1.json
  def destroy
    @questiontag.destroy
    respond_to do |format|
      format.html { redirect_to questiontags_url, notice: 'Questiontag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questiontag
      @questiontag = Questiontag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def questiontag_params
      params.require(:questiontag).permit(:question_id, :tag_id)
    end
end
