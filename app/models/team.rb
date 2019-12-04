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

  #  has_many :matches, dependent: :destroy <- TODO: Should be this, fix later
  has_many :matches, class_name: "Match", foreign_key: "hometeam_id", dependent: :destroy
  has_many :matches, class_name: "Match", foreign_key: "awayteam_id", dependent: :destroy
  has_many :players, dependent: :destroy
end
