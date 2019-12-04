require 'test_helper'

class BattingInningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @batting_innings = batting_innings(:one)
  end

  #test "should get index" do
  #  get batting_innings_index_url
  #  assert_response :success
#
  #  assert_select 'title', 'CricketLeagues.com'
  #  assert_select 'h1', 'Batting Innings'
  #end

  test "should get new" do
    get new_batting_innings_url
    assert_response :success
  end

  test "should create batting_innings" do
    assert_difference('BattingInnings.count') do
      post batting_innings_index_url, params: { batting_innings: { Innings_id: @batting_innings.Innings_id, Player_id: @batting_innings.Player_id, batsman_number: @batting_innings.batsman_number, balls: @batting_innings.balls, bowler_id: @batting_innings.bowler_id, fielder_id: @batting_innings.fielder_id, fours: @batting_innings.fours, howout: @batting_innings.howout, runs: @batting_innings.runs, sixes: @batting_innings.sixes } }
    end

    assert_redirected_to batting_innings_url(BattingInnings.last)
  end

  test "should show batting_innings" do
    get batting_innings_url(@batting_innings)
    assert_response :success
  end

  test "should get edit" do
    get edit_batting_innings_url(@batting_innings)
    assert_response :success
  end

  test "should update batting_innings" do
    patch batting_innings_url(@batting_innings), params: { batting_innings: { Innings_id: @batting_innings.Innings_id, Player_id: @batting_innings.Player_id, batsman_number: @batting_innings.batsman_number, balls: @batting_innings.balls, bowler_id: @batting_innings.bowler_id, fielder_id: @batting_innings.fielder_id, fours: @batting_innings.fours, howout: @batting_innings.howout, runs: @batting_innings.runs, sixes: @batting_innings.sixes } }
    assert_redirected_to batting_innings_url(@batting_innings)
  end

  test "should destroy batting_innings" do
    assert_difference('BattingInnings.count', -1) do
      delete batting_innings_url(@batting_innings)
    end

    assert_redirected_to batting_innings_index_url
  end
end
