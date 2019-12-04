require 'test_helper'

class InningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @innings = innings(:one)
  end

  #test "should get index" do
  #  get innings_index_url
  #  assert_response :success
#
  #  assert_select 'title', 'CricketLeagues.com'
  #  assert_select 'h1', 'Innings'
  #end

  test "should get new" do
    get new_innings_url
    assert_response :success
  end

  test "should create innings" do
    assert_difference('Innings.count') do
      post innings_index_url, params: { innings: { byes: @innings.byes, hometeambatted: @innings.hometeambatted, legbyes: @innings.legbyes, match_id: @innings.match_id, penalties: @innings.penalties } }
    end

    assert_redirected_to innings_url(Innings.last)
  end

  test "should show innings" do
    get innings_url(@innings)
    assert_response :success
  end

  test "should get edit" do
    get edit_innings_url(@innings)
    assert_response :success
  end

  test "should update innings" do
    patch innings_url(@innings), params: { innings: { byes: @innings.byes, hometeambatted: @innings.hometeambatted, legbyes: @innings.legbyes, match_id: @innings.match_id, penalties: @innings.penalties } }
    assert_redirected_to innings_url(@innings)
  end

  test "should destroy innings" do
    assert_difference('Innings.count', -1) do
      delete innings_url(@innings)
    end

    assert_redirected_to innings_index_url
  end
end
