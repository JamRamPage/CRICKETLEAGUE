class BowlingInnings < ApplicationRecord
  belongs_to :Innings
  belongs_to :Player
  validates :Innings, :Player, :overs, :maidens, :runs, :wickets, :no_balls, :wides, presence: true
  validates :maidens, :runs, :no_balls, :wides, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :wickets, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  validates :overs, numericality: {greater_than: 0}

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
end
