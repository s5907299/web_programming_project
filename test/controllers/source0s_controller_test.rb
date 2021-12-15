require "test_helper"

class Source0sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source0 = source0s(:one)
  end

  test "should get index" do
    get source0s_url
    assert_response :success
  end

  test "should get new" do
    get new_source0_url
    assert_response :success
  end

  test "should create source0" do
    assert_difference('Source0.count') do
      post source0s_url, params: { source0: { anime_id: @source0.anime_id, desc: @source0.desc, platform1_id: @source0.platform1_id } }
    end

    assert_redirected_to source0_url(Source0.last)
  end

  test "should show source0" do
    get source0_url(@source0)
    assert_response :success
  end

  test "should get edit" do
    get edit_source0_url(@source0)
    assert_response :success
  end

  test "should update source0" do
    patch source0_url(@source0), params: { source0: { anime_id: @source0.anime_id, desc: @source0.desc, platform1_id: @source0.platform1_id } }
    assert_redirected_to source0_url(@source0)
  end

  test "should destroy source0" do
    assert_difference('Source0.count', -1) do
      delete source0_url(@source0)
    end

    assert_redirected_to source0s_url
  end
end
