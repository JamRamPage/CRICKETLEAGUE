class BowlingInningsController < ApplicationController
  before_action :set_bowling_innings, only: [:show, :edit, :update, :destroy]

  # GET /bowling_innings
  # GET /bowling_innings.json
  def index
    @bowling_innings = BowlingInnings.all
  end

  # GET /bowling_innings/1
  # GET /bowling_innings/1.json
  def show
  end

  # GET /bowling_innings/new
  def new
    @bowling_innings = BowlingInnings.new
  end

  # GET /bowling_innings/1/edit
  def edit
  end

  # POST /bowling_innings
  # POST /bowling_innings.json
  def create
    @bowling_innings = BowlingInnings.new(bowling_innings_params)

    respond_to do |format|
      if @bowling_innings.save
        format.html { redirect_to @bowling_innings, notice: 'Bowling innings was successfully created.' }
        format.json { render :show, status: :created, location: @bowling_innings }
      else
        format.html { render :new }
        format.json { render json: @bowling_innings.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bowling_innings/1
  # PATCH/PUT /bowling_innings/1.json
  def update
    respond_to do |format|
      if @bowling_innings.update(bowling_innings_params)
        format.html { redirect_to @bowling_innings, notice: 'Bowling innings was successfully updated.' }
        format.json { render :show, status: :ok, location: @bowling_innings }
      else
        format.html { render :edit }
        format.json { render json: @bowling_innings.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bowling_innings/1
  # DELETE /bowling_innings/1.json
  def destroy
    @bowling_innings.destroy
    respond_to do |format|
      format.html { redirect_to bowling_innings_index_url, notice: 'Bowling innings was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bowling_innings
      @bowling_innings = BowlingInnings.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bowling_innings_params
      params.require(:bowling_innings).permit(:Innings_id, :Player_id, :overs, :maidens, :runs, :wickets, :no_balls, :wides)
    end
end
