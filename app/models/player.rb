class Player < ApplicationRecord
  belongs_to :team
  enum role: [:Batter, :Bowler, :WicketKeeper]
  enum battinghand: [:Right, :Left]
  enum bowlingstyle: [:NA, :RF, :RFM, :RMF, :RM, :LF, :LFM, :LMF, :LM, :OB, :LB, :SLA, :SLC]
  validates :name, :DOB, :team, :role, :battinghand, :bowlingstyle, presence: true
end
