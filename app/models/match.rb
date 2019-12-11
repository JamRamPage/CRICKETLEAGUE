class Match < ApplicationRecord

  #Defines the two foreign keys (for the two teams who played in the match):
  belongs_to :hometeam, :class_name => 'Team', :foreign_key => 'hometeam_id'
  belongs_to :awayteam, :class_name => 'Team', :foreign_key => 'awayteam_id'

  validates :date, :hometeam, :awayteam, :stadium, presence: true

  #Used to check that the two teams are different:
  validates :hometeam, exclusion: {in: lambda{ |match| [match.awayteam]}}

  #Formats the match name like so:
  # => 2019-06-30: England V India
  def matchname
    "#{self.date}: #{self.hometeam.name} V #{self.awayteam.name}"
  end

  #A match is composed of up to 2 inningses (You might only enter 1 if the match
  #is currently ongoing)
  has_many :innings, dependent: :destroy
end
