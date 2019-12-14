require 'test_helper'

class BowlingInningsTest < ActiveSupport::TestCase
  setup do
    @innings = innings(:one)
    @player = players(:one)
  end

  test 'should not save empty bowling innings' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.save
    refute bowlinginnings.valid?
  end

  test 'should save valid bowling innings' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.Innings = @innings
    bowlinginnings.Player = @player
    bowlinginnings.overs = 4.5
    bowlinginnings.maidens = 0
    bowlinginnings.runs = 24
    bowlinginnings.wickets = 2
    bowlinginnings.no_balls = 0
    bowlinginnings.wides = 0

    bowlinginnings.save
    assert bowlinginnings.valid?
  end

  test 'should not save bowling innings without innings' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.Innings = nil
    bowlinginnings.Player = @player
    bowlinginnings.overs = 4.5
    bowlinginnings.maidens = 0
    bowlinginnings.runs = 24
    bowlinginnings.wickets = 2
    bowlinginnings.no_balls = 0
    bowlinginnings.wides = 0

    bowlinginnings.save
    refute bowlinginnings.valid?
  end

  test 'should not save bowling innings without player' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.Innings = @innings
    bowlinginnings.Player = nil
    bowlinginnings.overs = 4.5
    bowlinginnings.maidens = 0
    bowlinginnings.runs = 24
    bowlinginnings.wickets = 2
    bowlinginnings.no_balls = 0
    bowlinginnings.wides = 0

    bowlinginnings.save
    refute bowlinginnings.valid?
  end

  test 'should not save bowling innings with negative overs' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.Innings = @innings
    bowlinginnings.Player = @player
    bowlinginnings.overs = -4.5
    bowlinginnings.maidens = 0
    bowlinginnings.runs = 24
    bowlinginnings.wickets = 2
    bowlinginnings.no_balls = 0
    bowlinginnings.wides = 0

    bowlinginnings.save
    refute bowlinginnings.valid?
  end

  test 'should not save bowling innings with negative maidens' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.Innings = @innings
    bowlinginnings.Player = @player
    bowlinginnings.overs = 4.5
    bowlinginnings.maidens = -1
    bowlinginnings.runs = 24
    bowlinginnings.wickets = 2
    bowlinginnings.no_balls = 0
    bowlinginnings.wides = 0

    bowlinginnings.save
    refute bowlinginnings.valid?
  end

  test 'should not save bowling innings with negative runs' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.Innings = @innings
    bowlinginnings.Player = @player
    bowlinginnings.overs = 4.5
    bowlinginnings.maidens = 0
    bowlinginnings.runs = -24
    bowlinginnings.wickets = 2
    bowlinginnings.no_balls = 0
    bowlinginnings.wides = 0

    bowlinginnings.save
    refute bowlinginnings.valid?
  end

  test 'should not save bowling innings with negative wickets' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.Innings = @innings
    bowlinginnings.Player = @player
    bowlinginnings.overs = 4.5
    bowlinginnings.maidens = 0
    bowlinginnings.runs = 24
    bowlinginnings.wickets = -2
    bowlinginnings.no_balls = 0
    bowlinginnings.wides = 0

    bowlinginnings.save
    refute bowlinginnings.valid?
  end

  test 'should not save bowling innings with wickets above 10' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.Innings = @innings
    bowlinginnings.Player = @player
    bowlinginnings.overs = 4.5
    bowlinginnings.maidens = 0
    bowlinginnings.runs = 24
    bowlinginnings.wickets = 11
    bowlinginnings.no_balls = 0
    bowlinginnings.wides = 0

    bowlinginnings.save
    refute bowlinginnings.valid?
  end

  test 'should not save bowling innings with negative no balls' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.Innings = @innings
    bowlinginnings.Player = @player
    bowlinginnings.overs = 4.5
    bowlinginnings.maidens = 0
    bowlinginnings.runs = 24
    bowlinginnings.wickets = 2
    bowlinginnings.no_balls = -1
    bowlinginnings.wides = 0

    bowlinginnings.save
    refute bowlinginnings.valid?
  end

  test 'should not save bowling innings with negative wides' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.Innings = @innings
    bowlinginnings.Player = @player
    bowlinginnings.overs = 4.5
    bowlinginnings.maidens = 0
    bowlinginnings.runs = 24
    bowlinginnings.wickets = 2
    bowlinginnings.no_balls = 0
    bowlinginnings.wides = -1

    bowlinginnings.save
    refute bowlinginnings.valid?
  end

  test 'should not save bowling innings with decimal wides' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.Innings = @innings
    bowlinginnings.Player = @player
    bowlinginnings.overs = 4.5
    bowlinginnings.maidens = 0
    bowlinginnings.runs = 24
    bowlinginnings.wickets = 2
    bowlinginnings.no_balls = 0
    bowlinginnings.wides = 0.5

    bowlinginnings.save
    refute bowlinginnings.valid?
  end

  test 'should not save bowling innings with decimal no balls' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.Innings = @innings
    bowlinginnings.Player = @player
    bowlinginnings.overs = 4.5
    bowlinginnings.maidens = 0
    bowlinginnings.runs = 24
    bowlinginnings.wickets = 2
    bowlinginnings.no_balls = 0.5
    bowlinginnings.wides = 0

    bowlinginnings.save
    refute bowlinginnings.valid?
  end

  test 'should not save bowling innings with decimal wickets' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.Innings = @innings
    bowlinginnings.Player = @player
    bowlinginnings.overs = 4.5
    bowlinginnings.maidens = 0
    bowlinginnings.runs = 24
    bowlinginnings.wickets = 2.5
    bowlinginnings.no_balls = 0
    bowlinginnings.wides = 0

    bowlinginnings.save
    refute bowlinginnings.valid?
  end

  test 'should not save bowling innings with decimal runs' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.Innings = @innings
    bowlinginnings.Player = @player
    bowlinginnings.overs = 4.5
    bowlinginnings.maidens = 0
    bowlinginnings.runs = 24.5
    bowlinginnings.wickets = 2
    bowlinginnings.no_balls = 0
    bowlinginnings.wides = 0

    bowlinginnings.save
    refute bowlinginnings.valid?
  end

  test 'should not save bowling innings with decimal maidens' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.Innings = @innings
    bowlinginnings.Player = @player
    bowlinginnings.overs = 4.5
    bowlinginnings.maidens = 0.5
    bowlinginnings.runs = 24
    bowlinginnings.wickets = 2
    bowlinginnings.no_balls = 0
    bowlinginnings.wides = 0

    bowlinginnings.save
    refute bowlinginnings.valid?
  end

  test 'should not save bowling innings with decimal component of overs above .5' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.Innings = @innings
    bowlinginnings.Player = @player
    bowlinginnings.overs = 4.6
    bowlinginnings.maidens = 0
    bowlinginnings.runs = 24
    bowlinginnings.wickets = 2
    bowlinginnings.no_balls = 0
    bowlinginnings.wides = 0

    bowlinginnings.save
    refute bowlinginnings.valid?
  end

  test 'should not save bowling innings with more maidens than overs' do
    bowlinginnings = BowlingInnings.new

    bowlinginnings.Innings = @innings
    bowlinginnings.Player = @player
    bowlinginnings.overs = 5
    bowlinginnings.maidens = 6
    bowlinginnings.runs = 24
    bowlinginnings.wickets = 2
    bowlinginnings.no_balls = 0
    bowlinginnings.wides = 0

    bowlinginnings.save
    refute bowlinginnings.valid?
  end
end
