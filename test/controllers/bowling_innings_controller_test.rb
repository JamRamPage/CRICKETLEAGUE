require 'test_helper'

class BowlingInningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @innings = innings(:one)
    @bowling_innings = bowling_innings(:one)
  end

  test "should get new" do
    get new_bowling_innings_url(Innings_id: @innings)
    assert_response :success
    assert_select 'h1', 'New Bowling Innings'
    assert_select 'label', 'Player'
    assert_select 'label', 'Overs'
    assert_select 'label', 'Maidens'
    assert_select 'label', 'Runs'
    assert_select 'label', 'Wickets'
    assert_select 'label', 'No balls'
    assert_select 'label', 'Wides'
    assert_select 'script' do
      assert_select '[src=?]', 'validate_bowling_innings_form.js'
    end
    assert_select 'a', 'Back'
    assert_select 'p', 'Copyright James Page 2019'
    assert_template layout: 'application'
  end

  test "should create bowling_innings" do
    assert_difference('BowlingInnings.count') do
      post bowling_innings_index_url, params: { bowling_innings: { Innings_id: @bowling_innings.Innings_id, Player_id: @bowling_innings.Player_id, maidens: @bowling_innings.maidens, no_balls: @bowling_innings.no_balls, overs: @bowling_innings.overs, runs: @bowling_innings.runs, wickets: @bowling_innings.wickets, wides: @bowling_innings.wides } }
    end

    assert_redirected_to match_path(Match.matchFromInnings(Innings.where("Innings.id" => @bowling_innings.Innings_id)))
  end

  test "should get edit" do
    get edit_bowling_innings_url(@bowling_innings)
    assert_response :success
    assert_select 'h1', 'Editing Bowling Innings'
    assert_select 'label', 'Player'
    assert_select 'label', 'Overs'
    assert_select 'label', 'Maidens'
    assert_select 'label', 'Runs'
    assert_select 'label', 'Wickets'
    assert_select 'label', 'No balls'
    assert_select 'label', 'Wides'
    assert_select 'script' do
      assert_select '[src=?]', 'validate_bowling_innings_form.js'
    end
    assert_select 'a', 'Back'
    assert_select 'p', 'Copyright James Page 2019'
    assert_template layout: 'application'
  end

  test "should update bowling_innings" do
    patch bowling_innings_url(@bowling_innings), params: { bowling_innings: { Innings_id: @bowling_innings.Innings_id, Player_id: @bowling_innings.Player_id, maidens: @bowling_innings.maidens, no_balls: @bowling_innings.no_balls, overs: @bowling_innings.overs, runs: @bowling_innings.runs, wickets: @bowling_innings.wickets, wides: @bowling_innings.wides } }
    assert_redirected_to match_path(Match.matchFromInnings(Innings.where("Innings.id" => @bowling_innings.Innings_id)))
  end

  test "should destroy bowling_innings" do
    assert_difference('BowlingInnings.count', -1) do
      delete bowling_innings_url(@bowling_innings)
    end

    assert_redirected_to match_path(Match.matchFromInnings(Innings.where("Innings.id" => @bowling_innings.Innings_id)))
  end
end
