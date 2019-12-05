require 'test_helper'

class InningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @innings = innings(:one)
    @match = matches(:one)
  end

  #test "should get index" do
  #  get innings_index_url
  #  assert_response :success
#
  #  assert_select 'title', 'CricketLeagues.com'
  #  assert_select 'h1', 'Innings'
  #end

  test "should get new" do
    get new_innings_url(@match)
    assert_response :success
  end

  test "should create innings" do
    assert_difference('Innings.count') do
      post match_innings_index_url(@match), params: { innings: { byes: @innings.byes, hometeambatted: @innings.hometeambatted, legbyes: @innings.legbyes, match_id: @match.id, penalties: @innings.penalties } }
    end

    assert_redirected_to match_innings_path(Innings.last)
  end

  test "should show innings" do
    get match_innings_url[@innings.id, @match.id]
    assert_response :success
  end

  test "should get edit" do
    get edit_match_innings_url(@match)
    assert_response :success
  end

  test "should update innings" do
    patch innings_url(@innings), params: { innings: { byes: @innings.byes, hometeambatted: @innings.hometeambatted, legbyes: @innings.legbyes, match_id: @match.id, penalties: @innings.penalties } }
    assert_redirected_to match_innings_path(@innings)
  end

  test "should destroy innings" do
    assert_difference('Innings.count', -1) do
      delete innings_url(@innings)
    end

    assert_redirected_to match_innings_index_url(@match)
  end
end
