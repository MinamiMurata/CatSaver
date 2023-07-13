require "test_helper"

class BlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blogs_index_url
    assert_response :success
  end

  test "should get new" do
    get blogs_new_url
    assert_response :success
  end

  test "should get create" do
    get blogs_create_url
    assert_response :success
  end

  test "should get show" do
    get blogs_show_url
    assert_response :success
  end

  test "should get confirm" do
    get blogs_confirm_url
    assert_response :success
  end

  test "should get edit" do
    get blogs_edit_url
    assert_response :success
  end

  test "should get update" do
    get blogs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get blogs_destroy_url
    assert_response :success
  end
end
