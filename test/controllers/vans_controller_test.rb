require 'test_helper'

class VansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vans_index_url
    assert_response :success
  end

  test "should get show" do
    get vans_show_url
    assert_response :success
  end

  test "should get new" do
    get vans_new_url
    assert_response :success
  end

  test "should get create" do
    get vans_create_url
    assert_response :success
  end

  test "should get edit" do
    get vans_edit_url
    assert_response :success
  end

  test "should get update" do
    get vans_update_url
    assert_response :success
  end

  test "should get destroy" do
    get vans_destroy_url
    assert_response :success
  end

end
