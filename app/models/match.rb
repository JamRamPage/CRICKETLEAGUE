class Match < ApplicationRecord

  #Defines the two foreign keys (for the teams who played in the match):
  belongs_to :hometeam, :class_name => 'Team', :foreign_key => 'hometeam_id'
  belongs_to :awayteam, :class_name => 'Team', :foreign_key => 'awayteam_id'

  validates :date, :hometeam, :awayteam, :stadium, presence: true

  #Used to check that the two teams are different:
  validates :hometeam, exclusion: {in: lambda{ |match| [match.awayteam]}}

  def matchname
    "#{self.date}: #{self.hometeam.name} V #{self.awayteam.name}"
  end

  has_many :innings, dependent: :destroy
end
