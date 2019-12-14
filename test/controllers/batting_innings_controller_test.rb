require 'test_helper'

class BattingInningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @innings = innings(:one)
    @batting_innings = batting_innings(:one)
  end

  test "should get new" do
    get new_batting_innings_url(Innings_id: @innings)
    assert_response :success
    assert_select 'h1', 'New Batting Innings'
    assert_select 'label', 'Player'
    assert_select 'label', 'Batsman number'
    assert_select 'label', 'Runs'
    assert_select 'label', 'Balls'
    assert_select 'label', 'Fours'
    assert_select 'label', 'Sixes'
    assert_select 'label', 'Howout'
    assert_select 'label', 'Bowler'
    assert_select 'label', 'Fielder'
    assert_select 'script' do
      assert_select '[src=?]', 'validate_batting_innings_form.js'
    end
    assert_select 'a', 'Back'
    assert_select 'p', 'Copyright James Page 2019'
    assert_template layout: 'application'
  end

  test "should create batting_innings" do
    assert_difference('BattingInnings.count') do
      post batting_innings_index_url, params: { batting_innings: { Innings_id: @batting_innings.Innings_id, Player_id: @batting_innings.Player_id, batsman_number: @batting_innings.batsman_number, balls: @batting_innings.balls, bowler_id: @batting_innings.bowler_id, fielder_id: @batting_innings.fielder_id, fours: @batting_innings.fours, howout: @batting_innings.howout, runs: @batting_innings.runs, sixes: @batting_innings.sixes } }
    end

    assert_redirected_to match_path(Match.matchFromInnings(Innings.where("Innings.id" => @batting_innings.Innings_id)))
  end

  test "should get edit" do
    get edit_batting_innings_url(@batting_innings)
    assert_response :success
    assert_select 'h1', 'Editing Batting Innings'
    assert_select 'label', 'Player'
    assert_select 'label', 'Batsman number'
    assert_select 'label', 'Runs'
    assert_select 'label', 'Balls'
    assert_select 'label', 'Fours'
    assert_select 'label', 'Sixes'
    assert_select 'label', 'Howout'
    assert_select 'label', 'Bowler'
    assert_select 'label', 'Fielder'
    assert_select 'script' do
      assert_select '[src=?]', 'validate_batting_innings_form.js'
    end
    assert_select 'a', 'Back'
    assert_select 'p', 'Copyright James Page 2019'
    assert_template layout: 'application'
  end

  test "should update batting_innings" do
    patch batting_innings_url(@batting_innings), params: { batting_innings: { Innings_id: @batting_innings.Innings_id, Player_id: @batting_innings.Player_id, batsman_number: @batting_innings.batsman_number, balls: @batting_innings.balls, bowler_id: @batting_innings.bowler_id, fielder_id: @batting_innings.fielder_id, fours: @batting_innings.fours, howout: @batting_innings.howout, runs: @batting_innings.runs, sixes: @batting_innings.sixes } }
    assert_redirected_to match_path(Match.matchFromInnings(Innings.where("Innings.id" => @batting_innings.Innings_id)))
  end

  test "should destroy batting_innings" do
    assert_difference('BattingInnings.count', -1) do
      delete batting_innings_url(@batting_innings)
    end

    assert_redirected_to match_path(Match.matchFromInnings(Innings.where("Innings.id" => @batting_innings.Innings_id)))
  end
end
