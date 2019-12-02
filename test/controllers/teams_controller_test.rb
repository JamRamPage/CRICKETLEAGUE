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
  end

  test "should get new" do
    get new_team_url
    assert_response :success
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

    assert_select 'title', 'CricketLeagues.com'
    assert_select 'p', 'New Player'
  end

  test "should get edit" do
    get edit_team_url(@team)
    assert_response :success
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
