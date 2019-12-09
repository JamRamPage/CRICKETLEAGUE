class BowlingInnings < ApplicationRecord
  belongs_to :Innings
  belongs_to :Player
  validates :Innings, :Player, :overs, :maidens, :runs, :wickets, :no_balls, :wides, presence: true
  validates :maidens, :runs, :no_balls, :wides, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :wickets, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  validates :overs, numericality: {greater_than: 0}
  #Number of overs is a float value, but it can only be up to (x).5 because an over is comprised
  # of six deliveries.
  validates_format_of :overs, :with => /\A[0-9]+\.[0-5]\z/

  #Works out the total number of balls bowled in a bowling innings:
  # Overs is given as a float, eg 5.4 (5 overs and 4 deliveries)
  # Each over is made up of 6 deliveries, so we take
  # the integer value of this and multiply by 6, then
  # add the remainder to get our total
  # e.g. 5.4 overs = 5 * 6 + 4 = 34 deliveries
  def ballsbowled
    6 * overs.floor(0) + (overs - overs.floor(0)) * 10
  end

  #Total runs conceded by the bowler (byes, leg byes and penalty runs)
  # are not counted against the bowler, so they are included
  # in the general Innings model instead).
  def runsconceded
    runs + noballs + wides
  end

  scope :setFromMatch, -> (match) {joins(:Innings => :match).where("Innings.match_id" => match)}
  scope :home, -> {where("innings.hometeambatted" => true)}
  scope :away, -> {where("innings.hometeambatted" => false)}

  scope :match, -> {joins(:Innings => :match).where("Innings.match_id" => match).where("bowling_innings.id" => self.id)}
end
