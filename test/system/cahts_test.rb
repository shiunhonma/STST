require "application_system_test_case"

class CahtsTest < ApplicationSystemTestCase
  setup do
    @caht = cahts(:one)
  end

  test "visiting the index" do
    visit cahts_url
    assert_selector "h1", text: "Cahts"
  end

  test "creating a Caht" do
    visit cahts_url
    click_on "New Caht"

    fill_in "Attachment", with: @caht.attachment
    fill_in "Message", with: @caht.message
    fill_in "User", with: @caht.user_id
    click_on "Create Caht"

    assert_text "Caht was successfully created"
    click_on "Back"
  end

  test "updating a Caht" do
    visit cahts_url
    click_on "Edit", match: :first

    fill_in "Attachment", with: @caht.attachment
    fill_in "Message", with: @caht.message
    fill_in "User", with: @caht.user_id
    click_on "Update Caht"

    assert_text "Caht was successfully updated"
    click_on "Back"
  end

  test "destroying a Caht" do
    visit cahts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Caht was successfully destroyed"
  end
end
