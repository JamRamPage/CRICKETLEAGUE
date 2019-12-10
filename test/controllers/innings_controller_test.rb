require 'test_helper'

class InningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @innings = innings(:two)
    @match = matches(:two)
  end

#Not needed anymore since I have removed the index page

#  test "should get index" do
#    get match_innings_index_url(@match)
#    assert_response :success
#
#    assert_select 'title', 'CricketLeagues.com'
#    assert_select 'h1', 'Innings'
#  end

  test "should get new" do
    get new_match_innings_url(@match, @innings)
    assert_response :success
  end

#  test "should create innings" do
#    assert_difference('Innings.count') do
#      post match_innings_index_url(@match), params: { innings: { byes: @innings.byes, hometeambatted: @innings.hometeambatted, legbyes: @innings.legbyes, match_id: @innings.match_id, penalties: @innings.penalties } }
#    end
#
#    assert_redirected_to match_innings_path(Innings.last)
#  end

#Not needed anymore since I have removed the show page

#  test "should show innings" do
#    get match_innings_url(@match, @innings)
#    assert_response :success
#  end

  test "should get edit" do
    get edit_match_innings_url(@match, @innings)
    assert_response :success
  end

  test "should update innings" do
    patch match_innings_url(@match, @innings), params: { innings: { byes: @innings.byes, hometeambatted: @innings.hometeambatted, legbyes: @innings.legbyes, match_id: @match, penalties: @innings.penalties } }
    assert_redirected_to match_path(@match) # We should return to the match that the innings is part of
  end

  test "should destroy innings" do
    assert_difference('Innings.count', -1) do
      delete match_innings_url(@match, @innings)
    end

    assert_redirected_to match_url(@match)
  end
end
