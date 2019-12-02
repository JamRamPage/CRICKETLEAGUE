require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  setup do
    @team = teams(:one)
  end

  test 'should not save empty player' do
    player = Player.new

    player.save
    refute player.valid?
  end

  test 'should save valid player' do
    player = Player.new

    player.name = "Joe Root"
    player.DOB = 1990-12-30
    player.team = @team
    player.role = 1
    player.battinghand = 1
    player.bowlingstyle = 10
    player.domesticteam = "Trent Rockets"

    player.save
    assert player.valid?
  end

  test 'should not save player without name' do
    player = Player.new

    player.name = ""
    player.DOB = 1990-12-30
    player.team = @team
    player.role = 1
    player.battinghand = 1
    player.bowlingstyle = 10
    player.domesticteam = "Trent Rockets"

    player.save
    refute player.valid?
  end

  test 'should not save player without DOB' do
    player = Player.new

    player.name = "Joe Root"
    player.DOB = ""
    player.team = @team
    player.role = 1
    player.battinghand = 1
    player.bowlingstyle = 10
    player.domesticteam = "Trent Rockets"

    player.save
    refute player.valid?
  end

  test 'should not save player without team' do
    player = Player.new

    player.name = "Joe Root"
    player.DOB = 1990-12-30
    player.team = nil
    player.role = 1
    player.battinghand = 1
    player.bowlingstyle = 10
    player.domesticteam = "Trent Rockets"

    player.save
    refute player.valid?
  end

  test 'should not save player without domestic team' do
    player = Player.new

    player.name = "Joe Root"
    player.DOB = 1990-12-30
    player.team = nil
    player.role = 1
    player.battinghand = 1
    player.bowlingstyle = 10
    player.domesticteam = nil

    player.save
    refute player.valid?
  end

end
