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
end
