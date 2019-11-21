class Match < ApplicationRecord
  belongs_to :hometeam, :class_name => 'Team', :foreign_key => 'hometeam_id'
  belongs_to :awayteam, :class_name => 'Team', :foreign_key => 'awayteam_id'

  validates :date, :hometeam, :awayteam, :stadium, presence: true
  def validate
    if (self.hometeam == self.awayteam)
      errors.add(:hometeam, "hometeam cannot equal awayteam")
      errors.add(:awayteam, "awayteam cannot equal hometeam")
    end
  end
end
