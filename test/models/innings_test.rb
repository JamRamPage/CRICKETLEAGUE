require 'test_helper'

class InningsTest < ActiveSupport::TestCase
  setup do
    @match = matches(:one)
  end

  test 'should not save empty innings' do
    innings = Innings.new

    innings.save
    refute innings.valid?
  end

  test 'should save valid innings' do
    innings = Innings.new

    innings.match = @match
    innings.hometeambatted = true
    innings.byes = 0
    innings.legbyes = 0
    innings.penalties = 0

    innings.save
    assert innings.valid?
  end

  test 'should not save innings without match' do
    innings = Innings.new

    innings.match = nil
    innings.hometeambatted = true
    innings.byes = 0
    innings.legbyes = 0
    innings.penalties = 0

    innings.save
    refute innings.valid?
  end

  test 'should not save innings with negative byes' do
    innings = Innings.new

    innings.match = @match
    innings.hometeambatted = true
    innings.byes = -1
    innings.legbyes = 0
    innings.penalties = 0

    innings.save
    refute innings.valid?
  end

  test 'should not save innings with negative legbyes' do
    innings = Innings.new

    innings.match = @match
    innings.hometeambatted = true
    innings.byes = 0
    innings.legbyes = -1
    innings.penalties = 0

    innings.save
    refute innings.valid?
  end

  test 'should not save innings with negative penalties' do
    innings = Innings.new

    innings.match = @match
    innings.hometeambatted = true
    innings.byes = 0
    innings.legbyes = 0
    innings.penalties = -1

    innings.save
    refute innings.valid?
  end

  test 'should not save innings with decimal byes' do
    innings = Innings.new

    innings.match = @match
    innings.hometeambatted = true
    innings.byes = 0.5
    innings.legbyes = 0
    innings.penalties = 0

    innings.save
    refute innings.valid?
  end

  test 'should not save innings with decimal legbyes' do
    innings = Innings.new

    innings.match = @match
    innings.hometeambatted = true
    innings.byes = 0
    innings.legbyes = 0.5
    innings.penalties = 0

    innings.save
    refute innings.valid?
  end

  test 'should not save innings with decimal penalties' do
    innings = Innings.new

    innings.match = @match
    innings.hometeambatted = true
    innings.byes = 0
    innings.legbyes = 0
    innings.penalties = 0.5

    innings.save
    refute innings.valid?
  end
end
