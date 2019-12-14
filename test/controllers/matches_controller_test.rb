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
    assert_select 'th', 'Date'
    assert_select 'th', 'Home Team'
    assert_select 'th', 'Home Score'
    assert_select 'th', 'V'
    assert_select 'th', 'Away Score'
    assert_select 'th', 'Away Team'
    assert_select 'th', 'Stadium'
    assert_select 'a', 'Show'
    assert_select 'a', 'Edit'
    assert_select 'a', 'Destroy'

    assert_select 'p', 'Copyright James Page 2019'
    assert_template layout: 'application'
  end

  test "should get new" do
    get new_match_url
    assert_response :success
    assert_select 'h1', 'New Match'
    assert_select 'label', 'Date'
    assert_select 'label', 'Hometeam'
    assert_select 'label', 'Awayteam'
    assert_select 'label', 'Stadium'
    assert_select 'script' do
      assert_select '[src=?]', 'validate_match_form.js'
    end
    assert_select 'a', 'Back'
    assert_select 'p', 'Copyright James Page 2019'
    assert_template layout: 'application'
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

    #Batting Inningses:
    assert_select 'th', 'Batsman'
    assert_select 'th', 'How Out'
    assert_select 'th', 'Runs'
    assert_select 'th', 'Balls'
    assert_select 'th', '4s'
    assert_select 'th', '6s'
    assert_select 'th', 'Strike Rate'
    assert_select 'th', 'Add'
    #Bowling Inningses:
    assert_select 'th', 'Bowler'
    assert_select 'th', 'Overs'
    assert_select 'th', 'Maidens'
    assert_select 'th', 'Runs'
    assert_select 'th', 'Wickets'
    assert_select 'th', 'Economy'
    assert_select 'th', 'No Balls'
    assert_select 'th', 'Wides'
    assert_select 'th', 'Add'

    assert_select 'a', 'Edit'
    assert_select 'a', 'Destroy'

    assert_select 'strong', 'Date'
    assert_select 'strong', 'Stadium'
    assert_select 'a', 'Back'
    assert_select 'p', 'Copyright James Page 2019'
    assert_template layout: 'application'
  end

  test "should get edit" do
    get edit_match_url(@match)
    assert_response :success
    assert_select 'h1', 'Editing Match'
    assert_select 'label', 'Date'
    assert_select 'label', 'Stadium'
    assert_select 'script' do
      assert_select '[src=?]', 'validate_match_form.js'
    end
    assert_select 'a', 'Back'
    assert_select 'p', 'Copyright James Page 2019'
    assert_template layout: 'application'
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
