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
end
