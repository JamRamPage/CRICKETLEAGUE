require 'test_helper'

class InningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @innings = innings(:two)
    @match = matches(:two)
  end

  test "should get new" do
    get new_match_innings_url(@match, @innings)
    assert_response :success
    assert_select 'h1', 'Create Innings'
    assert_select 'label', 'Byes'
    assert_select 'label', 'Legbyes'
    assert_select 'label', 'Penalties'
    assert_select 'script' do
      assert_select '[src=?]', 'validate_innings_form.js'
    end
    assert_select 'a', 'Back'
    assert_select 'p', 'Copyright James Page 2019'
    assert_template layout: 'application'
  end

  test "should get edit" do
    get edit_match_innings_url(@match, @innings)
    assert_response :success
    assert_select 'h1', 'Edit Innings'
    assert_select 'label', 'Byes'
    assert_select 'label', 'Legbyes'
    assert_select 'label', 'Penalties'
    assert_select 'script' do
      assert_select '[src=?]', 'validate_innings_form.js'
    end
    assert_select 'a', 'Back'
    assert_select 'p', 'Copyright James Page 2019'
    assert_template layout: 'application'
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
