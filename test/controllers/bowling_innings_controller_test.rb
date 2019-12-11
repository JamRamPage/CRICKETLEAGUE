require 'test_helper'

class BowlingInningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bowling_innings = bowling_innings(:one)
  end

  test "should get new" do
    get new_bowling_innings_url
    assert_response :success
  end

  test "should create bowling_innings" do
    assert_difference('BowlingInnings.count') do
      post bowling_innings_index_url, params: { bowling_innings: { Innings_id: @bowling_innings.Innings_id, Player_id: @bowling_innings.Player_id, maidens: @bowling_innings.maidens, no_balls: @bowling_innings.no_balls, overs: @bowling_innings.overs, runs: @bowling_innings.runs, wickets: @bowling_innings.wickets, wides: @bowling_innings.wides } }
    end

    assert_redirected_to bowling_innings_url(BowlingInnings.last)
  end

  test "should show bowling_innings" do
    get bowling_innings_url(@bowling_innings)
    assert_response :success
  end

  test "should get edit" do
    get edit_bowling_innings_url(@bowling_innings)
    assert_response :success
  end

  test "should update bowling_innings" do
    patch bowling_innings_url(@bowling_innings), params: { bowling_innings: { Innings_id: @bowling_innings.Innings_id, Player_id: @bowling_innings.Player_id, maidens: @bowling_innings.maidens, no_balls: @bowling_innings.no_balls, overs: @bowling_innings.overs, runs: @bowling_innings.runs, wickets: @bowling_innings.wickets, wides: @bowling_innings.wides } }
    assert_redirected_to bowling_innings_url(@bowling_innings)
  end

  test "should destroy bowling_innings" do
    assert_difference('BowlingInnings.count', -1) do
      delete bowling_innings_url(@bowling_innings)
    end

    assert_redirected_to matches_url
  end
end
