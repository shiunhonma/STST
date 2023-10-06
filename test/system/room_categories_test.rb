require "application_system_test_case"

class RoomCategoriesTest < ApplicationSystemTestCase
  setup do
    @room_category = room_categories(:one)
  end

  test "visiting the index" do
    visit room_categories_url
    assert_selector "h1", text: "Room Categories"
  end

  test "creating a Room category" do
    visit room_categories_url
    click_on "New Room Category"

    fill_in "Category name", with: @room_category.category_name
    click_on "Create Room category"

    assert_text "Room category was successfully created"
    click_on "Back"
  end

  test "updating a Room category" do
    visit room_categories_url
    click_on "Edit", match: :first

    fill_in "Category name", with: @room_category.category_name
    click_on "Update Room category"

    assert_text "Room category was successfully updated"
    click_on "Back"
  end

  test "destroying a Room category" do
    visit room_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Room category was successfully destroyed"
  end
end
