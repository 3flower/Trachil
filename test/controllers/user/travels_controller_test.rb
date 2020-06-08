require 'test_helper'

class User::TravelsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_travels_new_url
    assert_response :success
  end

  test "should get show" do
    get user_travels_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_travels_edit_url
    assert_response :success
  end

  test "should get index" do
    get user_travels_index_url
    assert_response :success
  end

end
