require "application_system_test_case"

class BattingInningsTest < ApplicationSystemTestCase
  setup do
    @batting_innings = batting_innings(:one)
  end

  test "visiting the index" do
    visit batting_innings_url
    assert_selector "h1", text: "Batting Innings"
  end

  test "creating a Batting innings" do
    visit batting_innings_url
    click_on "New Batting Innings"

    fill_in "Innings", with: @batting_innings.Innings_id
    fill_in "Player", with: @batting_innings.Player_id
    fill_in "Balls", with: @batting_innings.balls
    fill_in "Bowler", with: @batting_innings.bowler_id
    fill_in "Fielder", with: @batting_innings.fielder_id
    fill_in "Fours", with: @batting_innings.fours
    fill_in "Howout", with: @batting_innings.howout
    fill_in "Runs", with: @batting_innings.runs
    fill_in "Sixes", with: @batting_innings.sixes
    click_on "Create Batting innings"

    assert_text "Batting innings was successfully created"
    click_on "Back"
  end

  test "updating a Batting innings" do
    visit batting_innings_url
    click_on "Edit", match: :first

    fill_in "Innings", with: @batting_innings.Innings_id
    fill_in "Player", with: @batting_innings.Player_id
    fill_in "Balls", with: @batting_innings.balls
    fill_in "Bowler", with: @batting_innings.bowler_id
    fill_in "Fielder", with: @batting_innings.fielder_id
    fill_in "Fours", with: @batting_innings.fours
    fill_in "Howout", with: @batting_innings.howout
    fill_in "Runs", with: @batting_innings.runs
    fill_in "Sixes", with: @batting_innings.sixes
    click_on "Update Batting innings"

    assert_text "Batting innings was successfully updated"
    click_on "Back"
  end

  test "destroying a Batting innings" do
    visit batting_innings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Batting innings was successfully destroyed"
  end
end
