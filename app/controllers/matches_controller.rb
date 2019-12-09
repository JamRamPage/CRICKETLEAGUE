class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    #Sorts the list of matches according to their date
    #Most recent/ furthest in future appear first:
    @matches = Match.all.sort {|match1, match2| match2.date <=> match1.date}
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    #Fetches the list of batting and bowling inningses for both teams (show will display them
    # in a scorecard form)
    @homebattinginnings = BattingInnings.setFromMatch(@match).home
    @awaybattinginnings = BattingInnings.setFromMatch(@match).away
    @homebowlinginnings = BowlingInnings.setFromMatch(@match).home
    @awaybowlinginnings = BowlingInnings.setFromMatch(@match).away
    #Used to fetch the amount of extras that each team conceded
    @homeinnings = Innings.setFromMatch(@match).home[0]
    @awayinnings = Innings.setFromMatch(@match).away[0]
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)
    respond_to do |format|
      if @match.save
        @homeinnings = Innings.new(match: @match, hometeambatted: true)
        @awayinnings = Innings.new(match: @match, hometeambatted: false)
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:date, :hometeam_id, :awayteam_id, "stadium")
    end
end
