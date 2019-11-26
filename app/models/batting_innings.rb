class BattingInnings < ApplicationRecord
  belongs_to :Innings
  belongs_to :Player
  belongs_to :bowler, :class_name => 'Player', :foreign_key => 'bowler_id', optional: true
  belongs_to :fielder, :class_name => 'Player', :foreign_key => 'fielder_id', optional: true
  enum howout: [:NotOut, :DNB, :Bowled, :Caught, :LBW, :RunOut, :Stumped, :Retired, :HitBallTwice, :HitWicket, :ObstructingField, :TimedOut]

  #We do not necessarily require a bowler/fielder because a batsman may not have been out:
  validates :Innings, :Player, :runs, :balls, :fours, :sixes, :howout, presence: true

  validates :runs, :balls, :fours, :sixes, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
