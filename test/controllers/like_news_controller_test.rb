require "test_helper"

class LikeNewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like_news = like_news(:one)
  end

  test "should get index" do
    get like_news_index_url
    assert_response :success
  end

  test "should get new" do
    get new_like_news_url
    assert_response :success
  end

  test "should create like_news" do
    assert_difference('LikeNews.count') do
      post like_news_index_url, params: { like_news: { anime_news_id: @like_news.anime_news_id, user_id: @like_news.user_id } }
    end

    assert_redirected_to like_news_url(LikeNews.last)
  end

  test "should show like_news" do
    get like_news_url(@like_news)
    assert_response :success
  end

  test "should get edit" do
    get edit_like_news_url(@like_news)
    assert_response :success
  end

  test "should update like_news" do
    patch like_news_url(@like_news), params: { like_news: { anime_news_id: @like_news.anime_news_id, user_id: @like_news.user_id } }
    assert_redirected_to like_news_url(@like_news)
  end

  test "should destroy like_news" do
    assert_difference('LikeNews.count', -1) do
      delete like_news_url(@like_news)
    end

    assert_redirected_to like_news_index_url
  end
end
