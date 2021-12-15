require "test_helper"

class Platform1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @platform1 = platform1s(:one)
  end

  test "should get index" do
    get platform1s_url
    assert_response :success
  end

  test "should get new" do
    get new_platform1_url
    assert_response :success
  end

  test "should create platform1" do
    assert_difference('Platform1.count') do
      post platform1s_url, params: { platform1: { link: @platform1.link, name: @platform1.name } }
    end

    assert_redirected_to platform1_url(Platform1.last)
  end

  test "should show platform1" do
    get platform1_url(@platform1)
    assert_response :success
  end

  test "should get edit" do
    get edit_platform1_url(@platform1)
    assert_response :success
  end

  test "should update platform1" do
    patch platform1_url(@platform1), params: { platform1: { link: @platform1.link, name: @platform1.name } }
    assert_redirected_to platform1_url(@platform1)
  end

  test "should destroy platform1" do
    assert_difference('Platform1.count', -1) do
      delete platform1_url(@platform1)
    end

    assert_redirected_to platform1s_url
  end
end
