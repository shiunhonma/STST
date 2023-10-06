require "test_helper"

class CahtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caht = cahts(:one)
  end

  test "should get index" do
    get cahts_url
    assert_response :success
  end

  test "should get new" do
    get new_caht_url
    assert_response :success
  end

  test "should create caht" do
    assert_difference('Caht.count') do
      post cahts_url, params: { caht: { attachment: @caht.attachment, message: @caht.message, user_id: @caht.user_id } }
    end

    assert_redirected_to caht_url(Caht.last)
  end

  test "should show caht" do
    get caht_url(@caht)
    assert_response :success
  end

  test "should get edit" do
    get edit_caht_url(@caht)
    assert_response :success
  end

  test "should update caht" do
    patch caht_url(@caht), params: { caht: { attachment: @caht.attachment, message: @caht.message, user_id: @caht.user_id } }
    assert_redirected_to caht_url(@caht)
  end

  test "should destroy caht" do
    assert_difference('Caht.count', -1) do
      delete caht_url(@caht)
    end

    assert_redirected_to cahts_url
  end
end
