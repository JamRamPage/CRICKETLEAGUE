class Match < ApplicationRecord
  #Defines the two foreign keys (for the teams who played in the match):
  belongs_to :hometeam, :class_name => 'Team', :foreign_key => 'hometeam_id'
  belongs_to :awayteam, :class_name => 'Team', :foreign_key => 'awayteam_id'

  validates :date, :hometeam, :awayteam, :stadium, presence: true

  #Used to check that the two teams are different: TODO: fix this
  def validate
    if (:hometeam == :awayteam)
      errors.add(:hometeam, "hometeam cannot equal awayteam")
      errors.add(:awayteam, "awayteam cannot equal hometeam")
    end
  end

  def matchname
    "#{self.date}: #{self.hometeam} V #{self.awayteam}"
  end
end
