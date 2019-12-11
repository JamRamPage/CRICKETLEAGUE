class InningsController < ApplicationController
  before_action :get_match
  before_action :set_innings, only: [:show, :edit, :update, :destroy]

  # GET /matches/(:id)/innings/new
  def new
    @innings = @match.innings.build
  end

  # GET /matches/(:id)/innings/(:id)/edit
  def edit
  end

  # POST /matches/(:id)/innings
  # POST /innings.json
  def create
    #Makes an innings associated with a given match
    @innings = Innings.new(innings_params)

    respond_to do |format|
      if @innings.save
        format.html { redirect_to match_path(@match), notice: 'Innings was successfully created.' }
        format.json { render :show, status: :created, location: @innings }
      else
        format.html { render :new }
        format.json { render json: @innings.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/(:id)/innings/(:id)
  # PATCH/PUT /innings/(:id).json
  def update
    respond_to do |format|
      if @innings.update(innings_params)
        format.html { redirect_to match_path(@match), notice: 'Innings was successfully updated.' }
        format.json { render :show, status: :ok, location: @innings }
      else
        format.html { render :edit }
        format.json { render json: @innings.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /innings/1
  # DELETE /innings/1.json
  # This cannot happen directly by the user from the design of the program.
  # A user can create a match, but when viewing it to add inningses,
  # they can only create/edit as appropriate according to if the innings has
  # already been made or not
  def destroy
    #Called automatically when a match is destroyed
    @innings.destroy
    respond_to do |format|
      format.html { redirect_to match_path(@match), notice: 'Innings was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    #Returns the match that the innings corresponds to:
    def get_match
      @match = Match.find(params[:match_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_innings
      @innings = @match.innings.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def innings_params
      params.require(:innings).permit(:id, :match_id, :hometeambatted, :byes, :legbyes, :penalties)
    end
end
