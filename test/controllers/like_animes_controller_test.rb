require "test_helper"

class LikeAnimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like_anime = like_animes(:one)
  end

  test "should get index" do
    get like_animes_url
    assert_response :success
  end

  test "should get new" do
    get new_like_anime_url
    assert_response :success
  end

  test "should create like_anime" do
    assert_difference('LikeAnime.count') do
      post like_animes_url, params: { like_anime: { anime_id: @like_anime.anime_id, user_id: @like_anime.user_id } }
    end

    assert_redirected_to like_anime_url(LikeAnime.last)
  end

  test "should show like_anime" do
    get like_anime_url(@like_anime)
    assert_response :success
  end

  test "should get edit" do
    get edit_like_anime_url(@like_anime)
    assert_response :success
  end

  test "should update like_anime" do
    patch like_anime_url(@like_anime), params: { like_anime: { anime_id: @like_anime.anime_id, user_id: @like_anime.user_id } }
    assert_redirected_to like_anime_url(@like_anime)
  end

  test "should destroy like_anime" do
    assert_difference('LikeAnime.count', -1) do
      delete like_anime_url(@like_anime)
    end

    assert_redirected_to like_animes_url
  end
end
