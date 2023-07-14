require "test_helper"

class CatsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cats_new_url
    assert_response :success
  end

  test "should get show" do
    get cats_show_url
    assert_response :success
  end

  test "should get confirm" do
    get cats_confirm_url
    assert_response :success
  end

  test "should get edit" do
    get cats_edit_url
    assert_response :success
  end
end
