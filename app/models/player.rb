class Player < ApplicationRecord
  belongs_to :team
  #Defines enumerations for a player's roles in a team:
  enum role: [:Batter, :Bowler, :WicketKeeper, :AllRounder]
  enum battinghand: [:Right, :Left]
  #NA used for players who don't bowl (wicket keepers and some batsmen)
  # Abbreviations used for bowling styles, might change later:
  enum bowlingstyle: [:NA, :RF, :RFM, :RMF, :RM, :LF, :LFM, :LMF, :LM, :OB, :LB, :SLA, :SLC]
  validates :name, :DOB, :team, :role, :battinghand, :bowlingstyle, presence: true


  #Works out the batting statistics for every batter (used in methods below):
  def battingStats
    BattingInnings.joins(:Player).select("name, SUM(runs), SUM(fours), SUM(sixes), MAX(runs)").group(:name)
  end
  #Works out the total inningses each player batted in:
  def matchesBatted
    BattingInnings.joins(:Player).group(:name)
  end
  #Works out the total runs batted for a given player (across all of their inningses):
  def totalRunsBatted
    self.battingStats.sum("runs")[self.name.to_s]
  end

  #Works out the bowling statistics for every bowler (used in methods below):
  def bowlingStats
    BowlingInnings.joins(:Player).select("name, SUM(wickets), SUM(runs)").group(:name)
  end
  #Returns all the bowling innings records for a particular player:
  def matchesBowled
    BowlingInnings.joins(:Player).where("player_id" => self.id)
  end
  #Works out the total number of wickets the bowler got across all of their inningses:
  def totalWickets
    if (self.bowlingStats.sum("wickets")[self.name.to_s] != nil) then
      self.bowlingStats.sum("wickets")[self.name.to_s]
    else
      ""
    end
  end
  #Works out the total number of runs the bowler conceded ("" if not a bowler):
  def totalRunsConceded
    if (self.bowlingStats.sum("runs")[self.name.to_s] != nil) then
      self.bowlingStats.sum("runs")[self.name.to_s]
    else
      ""
    end
  end
  scope :bowlers, -> {where.not("bowlingstyle" => 0)}

  has_many :bowling_innings, dependent: :destroy
  has_many :batting_innings, dependent: :destroy
end
