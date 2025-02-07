require 'test_helper'

class BattingInningsTest < ActiveSupport::TestCase
  setup do
    @innings = innings(:one)
    @player = players(:one)
  end

  test 'should not save empty batting innings' do
    battinginnings = BattingInnings.new

    battinginnings.save
    refute battinginnings.valid?
  end

  test 'should save valid batting innings' do
    battinginnings = BattingInnings.new

    battinginnings.Innings = @innings
    battinginnings.Player = @player
    battinginnings.runs = 50
    battinginnings.balls = 48
    battinginnings.fours = 3
    battinginnings.sixes = 2
    battinginnings.howout = 0
    battinginnings.batsman_number = 3

    battinginnings.save
    assert battinginnings.valid?
  end

  test 'should not save batting innings without innings' do
    battinginnings = BattingInnings.new

    battinginnings.Innings = nil
    battinginnings.Player = @player
    battinginnings.runs = 50
    battinginnings.balls = 48
    battinginnings.fours = 3
    battinginnings.sixes = 2
    battinginnings.howout = 0
    battinginnings.batsman_number = 3

    battinginnings.save
    refute battinginnings.valid?
  end

  test 'should not save batting innings without player' do
    battinginnings = BattingInnings.new

    battinginnings.Innings = @innings
    battinginnings.Player = nil
    battinginnings.runs = 50
    battinginnings.balls = 48
    battinginnings.fours = 3
    battinginnings.sixes = 2
    battinginnings.howout = 0
    battinginnings.batsman_number = 3

    battinginnings.save
    refute battinginnings.valid?
  end

  test 'should not save batting innings with negative runs' do
    battinginnings = BattingInnings.new

    battinginnings.Innings = @innings
    battinginnings.Player = @player
    battinginnings.runs = -50
    battinginnings.balls = 48
    battinginnings.fours = 3
    battinginnings.sixes = 2
    battinginnings.howout = 0
    battinginnings.batsman_number = 3

    battinginnings.save
    refute battinginnings.valid?
  end

  test 'should not save batting innings with negative balls' do
    battinginnings = BattingInnings.new

    battinginnings.Innings = @innings
    battinginnings.Player = @player
    battinginnings.runs = 50
    battinginnings.balls = -48
    battinginnings.fours = 3
    battinginnings.sixes = 2
    battinginnings.howout = 0
    battinginnings.batsman_number = 3

    battinginnings.save
    refute battinginnings.valid?
  end

  test 'should not save batting innings with negative fours' do
    battinginnings = BattingInnings.new

    battinginnings.Innings = @innings
    battinginnings.Player = @player
    battinginnings.runs = 50
    battinginnings.balls = 48
    battinginnings.fours = -3
    battinginnings.sixes = 2
    battinginnings.howout = 0
    battinginnings.batsman_number = 3

    battinginnings.save
    refute battinginnings.valid?
  end

  test 'should not save batting innings with negative sixes' do
    battinginnings = BattingInnings.new

    battinginnings.Innings = @innings
    battinginnings.Player = @player
    battinginnings.runs = 50
    battinginnings.balls = 48
    battinginnings.fours = 3
    battinginnings.sixes = -2
    battinginnings.howout = 0
    battinginnings.batsman_number = 3

    battinginnings.save
    refute battinginnings.valid?
  end

  test 'should not save batting innings with decimal runs' do
    battinginnings = BattingInnings.new

    battinginnings.Innings = @innings
    battinginnings.Player = @player
    battinginnings.runs = 0.5
    battinginnings.balls = 48
    battinginnings.fours = 3
    battinginnings.sixes = 2
    battinginnings.howout = 0
    battinginnings.batsman_number = 3

    battinginnings.save
    refute battinginnings.valid?
  end

  test 'should not save batting innings with decimal balls' do
    battinginnings = BattingInnings.new

    battinginnings.Innings = @innings
    battinginnings.Player = @player
    battinginnings.runs = 50
    battinginnings.balls = 4.8
    battinginnings.fours = 3
    battinginnings.sixes = 2
    battinginnings.howout = 0
    battinginnings.batsman_number = 3

    battinginnings.save
    refute battinginnings.valid?
  end

  test 'should not save batting innings with decimal fours' do
    battinginnings = BattingInnings.new

    battinginnings.Innings = @innings
    battinginnings.Player = @player
    battinginnings.runs = 50
    battinginnings.balls = 48
    battinginnings.fours = 0.3
    battinginnings.sixes = 2
    battinginnings.howout = 0
    battinginnings.batsman_number = 3

    battinginnings.save
    refute battinginnings.valid?
  end

  test 'should not save batting innings with decimal sixes' do
    battinginnings = BattingInnings.new

    battinginnings.Innings = @innings
    battinginnings.Player = @player
    battinginnings.runs = 50
    battinginnings.balls = 48
    battinginnings.fours = 3
    battinginnings.sixes = 0.2
    battinginnings.howout = 0
    battinginnings.batsman_number = 3

    battinginnings.save
    refute battinginnings.valid?
  end

  test 'should not save batting innings with sixes > balls' do
    battinginnings = BattingInnings.new

    battinginnings.Innings = @innings
    battinginnings.Player = @player
    battinginnings.runs = 5000
    battinginnings.balls = 1
    battinginnings.fours = 3
    battinginnings.sixes = 5
    battinginnings.howout = 0
    battinginnings.batsman_number = 3

    battinginnings.save
    refute battinginnings.valid?
  end

  test 'should not save batting innings with fours > balls' do
    battinginnings = BattingInnings.new

    battinginnings.Innings = @innings
    battinginnings.Player = @player
    battinginnings.runs = 5000
    battinginnings.balls = 1
    battinginnings.fours = 5
    battinginnings.sixes = 0
    battinginnings.howout = 0
    battinginnings.batsman_number = 3

    battinginnings.save
    refute battinginnings.valid?
  end

  test 'should not save batting innings with sixes > runs/6' do
    battinginnings = BattingInnings.new

    battinginnings.Innings = @innings
    battinginnings.Player = @player
    battinginnings.runs = 17
    battinginnings.balls = 20
    battinginnings.fours = 0
    battinginnings.sixes = 3
    battinginnings.howout = 0
    battinginnings.batsman_number = 3

    battinginnings.save
    refute battinginnings.valid?
  end

  test 'should not save batting innings with fours > runs/6' do
    battinginnings = BattingInnings.new

    battinginnings.Innings = @innings
    battinginnings.Player = @player
    battinginnings.runs = 19
    battinginnings.balls = 6
    battinginnings.fours = 5
    battinginnings.sixes = 0
    battinginnings.howout = 0
    battinginnings.batsman_number = 3

    battinginnings.save
    refute battinginnings.valid?
  end

end
