class BattingInningsController < ApplicationController
  before_action :set_batting_innings, only: [:show, :edit, :update, :destroy]

  # GET /batting_innings/new
  def new
    @batting_innings = BattingInnings.new
  end

  # GET /batting_innings/1/edit
  def edit
  end

  # POST /batting_innings
  # POST /batting_innings.json
  def create
    @batting_innings = BattingInnings.new(batting_innings_params)

    respond_to do |format|
      if @batting_innings.save
        format.html { redirect_to matches_path, notice: 'Batting innings was successfully created.' }
        format.json { render :show, status: :created, location: @batting_innings }
      else
        format.html { render :new }
        format.json { render json: @batting_innings.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batting_innings/1
  # PATCH/PUT /batting_innings/1.json
  def update
    respond_to do |format|
      if @batting_innings.update(batting_innings_params)
        format.html { redirect_to matches_path, notice: 'Batting innings was successfully updated.' }
        format.json { render :show, status: :ok, location: @batting_innings }
      else
        format.html { render :edit }
        format.json { render json: @batting_innings.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batting_innings/1
  # DELETE /batting_innings/1.json
  def destroy
    @batting_innings.destroy
    respond_to do |format|
      format.html { redirect_to matches_path, notice: 'Batting innings was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batting_innings
      @batting_innings = BattingInnings.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batting_innings_params
      params.require(:batting_innings).permit(:Innings_id, :Player_id, :batsman_number, :runs, :balls, :fours, :sixes, :howout, :bowler_id, :fielder_id)
    end
end
