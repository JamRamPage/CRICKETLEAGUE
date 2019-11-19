class Team < ApplicationRecord
  def score
    2 * won + drawn + noresult
  end
  def played
    won + drawn + lost + noresult
  end
end
