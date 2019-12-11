class PlayersController < ApplicationController
  before_action :get_team
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /teams/(:id)/players/new
  def new
    @player = @team.players.build
  end

  # GET /teams/(:id)/players/1/edit
  def edit
  end

  # POST /teams/(:id)/players
  # POST /players.json
  def create
    #Makes a player associated with a given team
    @player = @team.players.build(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to team_path(@team), notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/(:id)/players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to team_path(@team), notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/(:id)/players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to team_path(@team), notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    #Returns the team a player is associated with
    def get_team
      @team = Team.find(params[:team_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = @team.players.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:id, :team_id, :name, :DOB, :role, :battinghand, :bowlingstyle, :domesticteam)
    end
end
