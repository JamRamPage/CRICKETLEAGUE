require 'test_helper'

class MatchesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @match = matches(:one)
  end

  test "should get index" do
    get matches_url
    assert_response :success

    assert_select 'title', 'CricketLeagues.com'
    assert_select 'h1', 'Matches'
    assert_select 'p', 'Copyright James Page 2019'
    assert_select 'th', 'Date'
    assert_select 'th', 'Home Team'
    assert_select 'th', 'Home Score'
    assert_select 'th', 'V'
    assert_select 'th', 'Away Score'
    assert_select 'th', 'Away Team'
    assert_select 'th', 'Stadium'
  end

  test "should get new" do
    get new_match_url
    assert_response :success
  end

  test "should create match" do
    assert_difference('Match.count') do
      post matches_url, params: { match: { awayteam_id: @match.awayteam_id, date: @match.date, hometeam_id: @match.hometeam_id, stadium: @match.stadium } }
    end

    assert_redirected_to match_url(Match.last)
  end

  test "should show match" do
    get match_url(@match)
    assert_response :success

    assert_select 'title', 'CricketLeagues.com'
    assert_select 'p', 'Create Innings'
  end

  test "should get edit" do
    get edit_match_url(@match)
    assert_response :success
  end

  test "should update match" do
    patch match_url(@match), params: { match: { awayteam_id: @match.awayteam_id, date: @match.date, hometeam_id: @match.hometeam_id, stadium: @match.stadium } }
    assert_redirected_to match_url(@match)
  end

  test "should destroy match" do
    assert_difference('Match.count', -1) do
      delete match_url(@match)
    end

    assert_redirected_to matches_url
  end
end
