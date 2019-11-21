class Player < ApplicationRecord
  belongs_to :team
  #Defines enumerations for a player's roles in a team:
  enum role: [:Batter, :Bowler, :WicketKeeper]
  enum battinghand: [:Right, :Left]
  #NA used for players who don't bowl (wicket keepers and some batsmen)
  # Abbreviations used for bowling styles, might change later:
  enum bowlingstyle: [:NA, :RF, :RFM, :RMF, :RM, :LF, :LFM, :LMF, :LM, :OB, :LB, :SLA, :SLC]
  validates :name, :DOB, :team, :role, :battinghand, :bowlingstyle, presence: true
end
