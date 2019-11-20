require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not save team without name' do
    team = Team.new

    team.save
    refute team.valid?
  end

  test 'should save team with name' do
    team = Team.new

    team.name = 'Australia'
    team.won = 7
    team.lost = 2
    team.drawn = 0
    team.noresult = 0

    team.save
    assert team.valid?
  end

  test 'should not save team with negative game vals' do
    team = Team.new

    team.name = 'India'
    team.won = -1
    team.lost = -1
    team.drawn = -1
    team.noresult = -1

    team.save
    refute team.valid?
  end

  test 'should not save team with non integer game vals' do
    team = Team.new

    team.name = 'India'
    team.won = 0.5
    team.lost = 0.5
    team.drawn = 0.5
    team.noresult = 0.5

    team.save
    refute team.valid?
  end

end
