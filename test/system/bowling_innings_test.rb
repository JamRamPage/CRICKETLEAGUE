require "application_system_test_case"

class BowlingInningsTest < ApplicationSystemTestCase
  setup do
    @bowling_innings = bowling_innings(:one)
  end

  test "visiting the index" do
    visit bowling_innings_url
    assert_selector "h1", text: "Bowling Innings"
  end

  test "creating a Bowling innings" do
    visit bowling_innings_url
    click_on "New Bowling Innings"

    fill_in "Innings", with: @bowling_innings.Innings_id
    fill_in "Player", with: @bowling_innings.Player_id
    fill_in "Maidens", with: @bowling_innings.maidens
    fill_in "No balls", with: @bowling_innings.no_balls
    fill_in "Overs", with: @bowling_innings.overs
    fill_in "Runs", with: @bowling_innings.runs
    fill_in "Wickets", with: @bowling_innings.wickets
    fill_in "Wides", with: @bowling_innings.wides
    click_on "Create Bowling innings"

    assert_text "Bowling innings was successfully created"
    click_on "Back"
  end

  test "updating a Bowling innings" do
    visit bowling_innings_url
    click_on "Edit", match: :first

    fill_in "Innings", with: @bowling_innings.Innings_id
    fill_in "Player", with: @bowling_innings.Player_id
    fill_in "Maidens", with: @bowling_innings.maidens
    fill_in "No balls", with: @bowling_innings.no_balls
    fill_in "Overs", with: @bowling_innings.overs
    fill_in "Runs", with: @bowling_innings.runs
    fill_in "Wickets", with: @bowling_innings.wickets
    fill_in "Wides", with: @bowling_innings.wides
    click_on "Update Bowling innings"

    assert_text "Bowling innings was successfully updated"
    click_on "Back"
  end

  test "destroying a Bowling innings" do
    visit bowling_innings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bowling innings was successfully destroyed"
  end
end
