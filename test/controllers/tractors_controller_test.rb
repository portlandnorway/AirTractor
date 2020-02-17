require 'test_helper'

class TractorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tractors_index_url
    assert_response :success
  end

  test "should get show" do
    get tractors_show_url
    assert_response :success
  end

  test "should get new" do
    get tractors_new_url
    assert_response :success
  end

end
