require 'test_helper'

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player = players(:one)
    @team = teams(:one)
  end

  test "should get index" do
    get team_player_index_url(@team)
    assert_response :success

    assert_select 'title', 'CricketLeagues.com'
    assert_select 'h1', 'Players'
  end

  test "should get new" do
    get new_team_player_url(@team, @player)
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post team_players_url(@team), method: :create, params: { player: { DOB: @player.DOB, battinghand: @player.battinghand, bowlingstyle: @player.bowlingstyle, domesticteam: @player.domesticteam, name: @player.name, role: @player.role, team_id: @player.team_id } }
    end

    assert_redirected_to team_player_url(Player.last)
  end

  test "should show player" do
    get team_player_url(@team, @player)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_player_url(@team, @player)
    assert_response :success
  end

  test "should update player" do
    patch team_player_url(@team, @player), params: { player: { DOB: @player.DOB, battinghand: @player.battinghand, bowlingstyle: @player.bowlingstyle, domesticteam: @player.domesticteam, name: @player.name, role: @player.role, team_id: @player.team_id } }
    assert_redirected_to team_path(@team)
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete team_player_url(@team, @player)
    end

    assert_redirected_to team_url(@team)
  end
end
