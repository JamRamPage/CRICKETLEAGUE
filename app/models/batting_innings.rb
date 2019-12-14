class BattingInnings < ApplicationRecord
  #BattingInnings is linker table between Innings and Player:
  belongs_to :Innings
  belongs_to :Player
  #BattingInnings also has two other Player fields (representing up to two)
  #members of other team that got the current batsman out.
  belongs_to :bowler, :class_name => 'Player', :foreign_key => 'bowler_id', optional: true
  belongs_to :fielder, :class_name => 'Player', :foreign_key => 'fielder_id', optional: true
  #The ways in which a batsman can get out in cricket:
  enum howout: [:NotOut, :DNB, :Bowled, :Caught, :LBW, :RunOut, :Stumped, :Retired, :HitBallTwice, :HitWicket, :ObstructingField, :TimedOut]

  #We do not necessarily require a bowler/fielder because a batsman may not have been out:
  #Also, some ways of getting out only involve one or the other, e.g.:
  # being bowled only involves a bowler
  # being run out only involves a fielder
  validates :Innings, :Player, :batsman_number, :runs, :balls, :fours, :sixes, :howout, :batsman_number, presence: true

  #All these must be >=0 and integers
  validates :runs, :balls, :fours, :sixes, :batsman_number, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  # A batsman cannot be the "zeroth" batsman! This determines the order in which the players batted:
  validates :batsman_number, numericality: {only_integer: true, greater_than: 0}

  #A batsman can't hit more fours or sixes than the number of deliveries they are bowled!
  validates :fours, :sixes, :numericality => {:less_than_or_equal_to => :balls}

  #Returns the correctly formatted way of describing how a batsman was out:
  #Used in displaying the scorecards:
  def outDescription
    begin
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
        "lbw b #{self.bowler.name}"
      elsif (self.howout_before_type_cast == 5) then
        "run out (#{self.fielder.name})"
      else
        "stumped #{self.fielder}"
      end
    rescue NoMethodError
      #Something went wrong - perhaps the user entered an invalid
      #combination, such as Caught, but left the bowler field blank
      "ERROR - PLEASE EDIT THIS INNINGS AND CORRECT IT"
    end
  end

  #The set of batting inningses given a match object:
  scope :setFromMatch, -> (match) {joins(:Innings => :match).where("Innings.match_id" => match)}
  #ONLY USE WITH ABOVE! Returns the batting inningses for each of the home and away teams:
  scope :home, -> {where("Innings.hometeambatted" => true).order(:batsman_number)}
  scope :away, -> {where("Innings.hometeambatted" => false).order(:batsman_number)}

  #The number of fours * 4 plus sixes * 6 must be <= number of runs
  validate :four_six_limit
  private
  def four_six_limit
    if fours*4+sixes*6 > runs
      errors.add(:fours, "Too many fours")
      errors.add(:sixes, "Too many sixes")
    end
  end

end
