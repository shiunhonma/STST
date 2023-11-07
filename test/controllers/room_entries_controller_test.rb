require "test_helper"

class RoomEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_entry = room_entries(:one)
  end

  test "should get index" do
    get room_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_room_entry_url
    assert_response :success
  end

  test "should create room_entry" do
    assert_difference('RoomEntry.count') do
      post room_entries_url, params: { room_entry: { comment: @room_entry.comment, flag: @room_entry.flag } }
    end

    assert_redirected_to room_entry_url(RoomEntry.last)
  end

  test "should show room_entry" do
    get room_entry_url(@room_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_entry_url(@room_entry)
    assert_response :success
  end

  test "should update room_entry" do
    patch room_entry_url(@room_entry), params: { room_entry: { comment: @room_entry.comment, flag: @room_entry.flag } }
    assert_redirected_to room_entry_url(@room_entry)
  end

  test "should destroy room_entry" do
    assert_difference('RoomEntry.count', -1) do
      delete room_entry_url(@room_entry)
    end

    assert_redirected_to room_entries_url
  end
end
