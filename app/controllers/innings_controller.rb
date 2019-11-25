class InningsController < ApplicationController
  before_action :set_innings, only: [:show, :edit, :update, :destroy]

  # GET /innings
  # GET /innings.json
  def index
    @innings = Innings.all
  end

  # GET /innings/1
  # GET /innings/1.json
  def show
  end

  # GET /innings/new
  def new
    @innings = Innings.new
  end

  # GET /innings/1/edit
  def edit
  end

  # POST /innings
  # POST /innings.json
  def create
    @innings = Innings.new(innings_params)

    respond_to do |format|
      if @innings.save
        format.html { redirect_to @innings, notice: 'Innings was successfully created.' }
        format.json { render :show, status: :created, location: @innings }
      else
        format.html { render :new }
        format.json { render json: @innings.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /innings/1
  # PATCH/PUT /innings/1.json
  def update
    respond_to do |format|
      if @innings.update(innings_params)
        format.html { redirect_to @innings, notice: 'Innings was successfully updated.' }
        format.json { render :show, status: :ok, location: @innings }
      else
        format.html { render :edit }
        format.json { render json: @innings.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /innings/1
  # DELETE /innings/1.json
  def destroy
    @innings.destroy
    respond_to do |format|
      format.html { redirect_to innings_index_url, notice: 'Innings was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_innings
      @innings = Innings.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def innings_params
      params.require(:innings).permit(:match_id, :hometeambatted, :byes, :legbyes, :penalties)
    end
end
