require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  setup do
    @team1 = teams(:one)
    @team2 = teams(:two)
  end

  test 'should not save empty match' do
    match = Match.new

    match.save
    refute match.valid?
  end

  test 'should save valid match' do
    match = Match.new

    match.date = 2019-06-30
    match.hometeam = @team2
    match.awayteam = @team1
    match.stadium = "Edgbaston"

    match.save
    assert match.valid?
  end
end
