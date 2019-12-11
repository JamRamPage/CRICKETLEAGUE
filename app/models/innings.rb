class Innings < ApplicationRecord
  belongs_to :match

  #These have to be positive integers:
  validates :byes, :legbyes, :penalties, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :match, :byes, :legbyes, :penalties, presence: true
  validates_inclusion_of :hometeambatted, :in => [true,false]
  #e.g. We cannot have two inningses in the same match that were both in the home team
  validates_uniqueness_of :hometeambatted, scope: [:id,:match]

  #Simply returns the name of the team that batted:
  def battingteam
    if (hometeambatted == true)
      "#{match.hometeam.name}"
    else
      "#{match.awayteam.name}"
    end
  end

  #Returns the name of the innings formatted like so:
  # => 2019-06-30: England V India
  def innings_name
    "#{match.matchname}: Batting team: #{self.battingteam}"
  end

  #Set of innings objects from a match:
  scope :setFromMatch, -> (match) {where("match_id" => match)}
  #The home/away inningses (use with above)
  scope :home, -> {where("hometeambatted" => true)}
  scope :away, -> {where("hometeambatted" => false)}



  #An innings has up to 11 batting_inningses and bowling inningses
  has_many :bowling_innings, dependent: :destroy
  has_many :batting_innings, dependent: :destroy
end
