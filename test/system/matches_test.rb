require "application_system_test_case"

class MatchesTest < ApplicationSystemTestCase
  setup do
    @match = matches(:one)
  end

  test "visiting the index" do
    visit matches_url
    assert_selector "h1", text: "Matches"
  end

  test "creating a Match" do
    visit matches_url
    click_on "New Match"

    fill_in "Awayteam", with: @match.awayteam_id
    fill_in "Date", with: @match.date
    fill_in "Hometeam", with: @match.hometeam_id
    fill_in "Stadium", with: @match.stadium
    click_on "Create Match"

    assert_text "Match was successfully created"
    click_on "Back"
  end

  test "updating a Match" do
    visit matches_url
    click_on "Edit", match: :first

    fill_in "Awayteam", with: @match.awayteam_id
    fill_in "Date", with: @match.date
    fill_in "Hometeam", with: @match.hometeam_id
    fill_in "Stadium", with: @match.stadium
    click_on "Update Match"

    assert_text "Match was successfully updated"
    click_on "Back"
  end

  test "destroying a Match" do
    visit matches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Match was successfully destroyed"
  end
end
