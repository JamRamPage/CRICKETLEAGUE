class BattingInnings < ApplicationRecord
  belongs_to :Innings
  belongs_to :Player
  belongs_to :bowler, :class_name => 'Player', :foreign_key => 'bowler_id', optional: true
  belongs_to :fielder, :class_name => 'Player', :foreign_key => 'fielder_id', optional: true
  enum howout: [:NotOut, :DNB, :Bowled, :Caught, :LBW, :RunOut, :Stumped, :Retired, :HitBallTwice, :HitWicket, :ObstructingField, :TimedOut]

  #We do not necessarily require a bowler/fielder because a batsman may not have been out:
  validates :Innings, :Player, :runs, :balls, :fours, :sixes, :howout, :batsman_number, presence: true

  validates :runs, :balls, :fours, :sixes, :batsman_number, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  def outDescription
    if (self.howout_before_type_cast == 0 || self.howout_before_type_cast == 1 || self.howout_before_type_cast > 7) then
      #description is enough, as these ways of getting out do
      # not relate to any fielders.
      howout
    elsif (self.howout_before_type_cast == 2) then
      #bowled out
      "b #{self.bowler.name}"
    elsif (self.howout_before_type_cast == 3) then
      if (self.bowler.name != self.fielder.name) then
        #caught by a different fielder to the bowler
        "c #{self.fielder.name} b #{self.bowler.name}"
      else
        #caught and bowled both by the bowler
        "c & b #{self.bowler.name}"
      end
    elsif (self.howout_before_type_cast == 4) then
      #lbw
      "lbw b #{self.bowler.name}"
    elsif (self.howout_before_type_cast == 5) then
      "run out (#{self.fielder.name})"
    else
      #Stumped
      "stumped #{self.fielder}"
    end
  end

end
