class Innings < ApplicationRecord
  belongs_to :match

  validates :byes, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :legbyes, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :penalties, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :match, :byes, :legbyes, :penalties, presence: true
  validates_inclusion_of :hometeambatted, :in => [true,false]
  validates_uniqueness_of :hometeambatted, scope: [:id,:match]

  def battingteam
    if (hometeambatted == true)
      "#{match.hometeam.name}"
    else
      "#{match.awayteam.name}"
    end
  end

  def innings_name
    "#{match.matchname}: Batting team: #{self.battingteam}"
  end

  scope :setFromMatch, -> (match) {where("match_id" => match)}
  scope :home, -> {where("hometeambatted" => true)}
  scope :away, -> {where("hometeambatted" => false)}

  scope :total_runs, lambda { joins(:bowling_innings).merge(BowlingInnings.runsconceded) }
  scope :total_balls, lambda { joins(:bowling_innings).merge(BowlingInnings.ballsbowled) }

  has_many :bowling_innings, dependent: :destroy
  has_many :batting_innings, dependent: :destroy
end
