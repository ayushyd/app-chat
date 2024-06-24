require "application_system_test_case"

class ArticesTest < ApplicationSystemTestCase
  setup do
    @artice = artices(:one)
  end

  test "visiting the index" do
    visit artices_url
    assert_selector "h1", text: "Artices"
  end

  test "should create artice" do
    visit artices_url
    click_on "New artice"

    fill_in "Body", with: @artice.body
    fill_in "Title", with: @artice.title
    click_on "Create Artice"

    assert_text "Artice was successfully created"
    click_on "Back"
  end

  test "should update Artice" do
    visit artice_url(@artice)
    click_on "Edit this artice", match: :first

    fill_in "Body", with: @artice.body
    fill_in "Title", with: @artice.title
    click_on "Update Artice"

    assert_text "Artice was successfully updated"
    click_on "Back"
  end

  test "should destroy Artice" do
    visit artice_url(@artice)
    click_on "Destroy this artice", match: :first

    assert_text "Artice was successfully destroyed"
  end
end
