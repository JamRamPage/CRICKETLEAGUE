class Team < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  # Values for games won, drawn. lost etc can only be postitive integers:
  validates :won, numericality: {only_integer: true}
  validates :won, numericality: {greater_than_or_equal_to: 0}
  validates :drawn, numericality: {only_integer: true}
  validates :drawn, numericality: {greater_than_or_equal_to: 0}
  validates :lost, numericality: {only_integer: true}
  validates :lost, numericality: {greater_than_or_equal_to: 0}
  validates :noresult, numericality: {only_integer: true}
  validates :noresult, numericality: {greater_than_or_equal_to: 0}

  # A team gets two points for a won game, and 1 point for each drawn or
  # abandoned game
  def score
    2 * won + drawn + noresult
  end
  # Obviously, the total games played is the sum of all these fields
  def played
    won + drawn + lost + noresult
  end

  #A team can be the hometeam or awayteam in many different matches,
  #thus we deal with the dependent: :destroy separately (if we destroy a team,
  #ALL matches that they played in (either as home or away) are removed.)
  has_many :homematches, foreign_key: "hometeam_id", dependent: :destroy, class_name: "Match"
  has_many :awaymatches, foreign_key: "awayteam_id", dependent: :destroy, class_name: "Match"

  has_many :players, dependent: :destroy
end
