require "application_system_test_case"

class InningsTest < ApplicationSystemTestCase
  setup do
    @innings = innings(:one)
  end

  test "visiting the index" do
    visit innings_url
    assert_selector "h1", text: "Innings"
  end

  test "creating a Innings" do
    visit innings_url
    click_on "New Innings"

    fill_in "Byes", with: @innings.byes
    check "Hometeambatted" if @innings.hometeambatted
    fill_in "Legbyes", with: @innings.legbyes
    fill_in "Match", with: @innings.match_id
    fill_in "Penalties", with: @innings.penalties
    click_on "Create Innings"

    assert_text "Innings was successfully created"
    click_on "Back"
  end

  test "updating a Innings" do
    visit innings_url
    click_on "Edit", match: :first

    fill_in "Byes", with: @innings.byes
    check "Hometeambatted" if @innings.hometeambatted
    fill_in "Legbyes", with: @innings.legbyes
    fill_in "Match", with: @innings.match_id
    fill_in "Penalties", with: @innings.penalties
    click_on "Update Innings"

    assert_text "Innings was successfully updated"
    click_on "Back"
  end

  test "destroying a Innings" do
    visit innings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Innings was successfully destroyed"
  end
end
