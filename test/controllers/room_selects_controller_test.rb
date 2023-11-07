require "test_helper"

class RoomSelectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get room_selects_index_url
    assert_response :success
  end
end
