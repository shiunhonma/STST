require "application_system_test_case"

class RoomEntriesTest < ApplicationSystemTestCase
  setup do
    @room_entry = room_entries(:one)
  end

  test "visiting the index" do
    visit room_entries_url
    assert_selector "h1", text: "Room Entries"
  end

  test "creating a Room entry" do
    visit room_entries_url
    click_on "New Room Entry"

    fill_in "Comment", with: @room_entry.comment
    check "Flag" if @room_entry.flag
    click_on "Create Room entry"

    assert_text "Room entry was successfully created"
    click_on "Back"
  end

  test "updating a Room entry" do
    visit room_entries_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @room_entry.comment
    check "Flag" if @room_entry.flag
    click_on "Update Room entry"

    assert_text "Room entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Room entry" do
    visit room_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Room entry was successfully destroyed"
  end
end
