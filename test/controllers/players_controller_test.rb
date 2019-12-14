require 'test_helper'

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player = players(:one)
    @team = teams(:one)
  end

  test "should get new" do
    get new_team_player_url(@team, @player)
    assert_response :success
    assert_select 'h1', 'New Player'
    assert_select 'label', 'Name'
    assert_select 'label', 'Dob'
    assert_select 'label', 'Role'
    assert_select 'label', 'Battinghand'
    assert_select 'label', 'Bowlingstyle'
    assert_select 'label', 'Domesticteam'
    assert_select 'script' do
      assert_select '[src=?]', 'validate_player_form.js'
    end
    assert_select 'a', 'Back'
    assert_select 'p', 'Copyright James Page 2019'
    assert_template layout: 'application'
  end

  test "should get edit" do
    get edit_team_player_url(@team, @player)
    assert_response :success
    assert_select 'h1', 'Editing Player'
    assert_select 'label', 'Name'
    assert_select 'label', 'Dob'
    assert_select 'label', 'Role'
    assert_select 'label', 'Battinghand'
    assert_select 'label', 'Bowlingstyle'
    assert_select 'label', 'Domesticteam'
    assert_select 'script' do
      assert_select '[src=?]', 'validate_player_form.js'
    end
    assert_select 'a', 'Back'
    assert_select 'p', 'Copyright James Page 2019'
    assert_template layout: 'application'
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
