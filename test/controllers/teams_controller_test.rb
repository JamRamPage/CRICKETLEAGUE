require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = teams(:one)
  end

  test "should get index" do
    get teams_url
    assert_response :success

    assert_select 'title', 'CricketLeagues.com'
    assert_select 'h1', 'Teams'
    assert_select 'th', 'Name'
    assert_select 'th', 'Played'
    assert_select 'th', 'Won'
    assert_select 'th', 'Drawn'
    assert_select 'th', 'Lost'
    assert_select 'th', 'No Result'
    assert_select 'th', 'Points'

    assert_select 'a', 'Show'
    assert_select 'a', 'Edit'
    assert_select 'a', 'Destroy'

    assert_select 'a', 'New Team'
    assert_select 'p', 'Copyright James Page 2019'
    assert_template layout: 'application'
  end

  test "should get new" do
    get new_team_url
    assert_response :success
    assert_select 'h1', 'New Team'
    assert_select 'label', 'Name'
    assert_select 'label', 'Won'
    assert_select 'label', 'Drawn'
    assert_select 'label', 'Lost'
    assert_select 'label', 'Noresult'
    assert_select 'script' do
      assert_select '[src=?]', 'validate_team_form.js'
    end
    assert_select 'a', 'Back'
    assert_select 'p', 'Copyright James Page 2019'
    assert_template layout: 'application'
  end

  test "should create team" do
    assert_difference('Team.count') do
      post teams_url, params: { team: { drawn: @team.drawn, lost: @team.lost, name: @team.name + " 1", noresult: @team.noresult, won: @team.won } }
    end

    assert_redirected_to team_url(Team.last)
  end

  test "should show team" do
    get team_url(@team)
    assert_response :success
    #Team details
    assert_select 'th', 'Name'
    assert_select 'th', 'Played'
    assert_select 'th', 'Won'
    assert_select 'th', 'Drawn'
    assert_select 'th', 'Lost'
    assert_select 'th', 'No Result'
    assert_select 'th', 'Points'

    #Player list in team:
    assert_select 'h1', 'Players'
    assert_select 'th', 'Name'
    assert_select 'th', 'DOB'
    assert_select 'th', 'Team'
    assert_select 'th', 'Role'
    assert_select 'th', 'Batting Hand'
    assert_select 'th', 'Bowling Style'
    assert_select 'th', 'Domestic Team'

    assert_select 'a', 'Edit'
    assert_select 'a', 'Destroy'
    assert_select 'a', 'New Player'

    assert_select 'a', 'Back'
    assert_select 'title', 'CricketLeagues.com'
    assert_select 'p', 'New Player'
    assert_template layout: 'application'
  end

  test "should get edit" do
    get edit_team_url(@team)
    assert_response :success
    assert_select 'h1', 'Editing Team'
    assert_select 'label', 'Name'
    assert_select 'label', 'Won'
    assert_select 'label', 'Drawn'
    assert_select 'label', 'Lost'
    assert_select 'label', 'Noresult'
    assert_select 'script' do
      assert_select '[src=?]', 'validate_team_form.js'
    end
    assert_select 'a', 'Back'
    assert_select 'p', 'Copyright James Page 2019'
    assert_template layout: 'application'
  end

  test "should update team" do
    patch team_url(@team), params: { team: { drawn: @team.drawn, lost: @team.lost, name: @team.name, noresult: @team.noresult, won: @team.won } }
    assert_redirected_to team_url(@team)
  end

  test "should destroy team" do
    assert_difference('Team.count', -1) do
      delete team_url(@team)
    end

    assert_redirected_to teams_url
  end
end
