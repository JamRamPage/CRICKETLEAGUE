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

  test 'should not save match between the same teams' do
    match = Match.new
    match.hometeam = @team1
    match.awayteam = @team1

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

  test 'should not save match without home team' do
    match = Match.new

    match.date = 2019-06-30
    match.hometeam = nil
    match.awayteam = @team1
    match.stadium = "Edgbaston"

    match.save
    refute match.valid?
  end

  test 'should not save match without away team' do
    match = Match.new

    match.date = 2019-06-30
    match.hometeam = @team1
    match.awayteam = nil
    match.stadium = "Edgbaston"

    match.save
    refute match.valid?
  end

  test 'should not save match without date' do
    match = Match.new

    match.date = ""
    match.hometeam = @team1
    match.awayteam = @team2
    match.stadium = "Edgbaston"

    match.save
    refute match.valid?
  end

  test 'should not save match without stadium' do
    match = Match.new

    match.date = 2019-06-30
    match.hometeam = @team1
    match.awayteam = @team2
    match.stadium = nil

    match.save
    refute match.valid?
  end
end
