require "test_helper"

class AnimeNewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anime_news = anime_news(:one)
  end

  test "should get index" do
    get anime_news_index_url
    assert_response :success
  end

  test "should get new" do
    get new_anime_news_url
    assert_response :success
  end

  test "should create anime_news" do
    assert_difference('AnimeNews.count') do
      post anime_news_index_url, params: { anime_news: { context: @anime_news.context, headline: @anime_news.headline } }
    end

    assert_redirected_to anime_news_url(AnimeNews.last)
  end

  test "should show anime_news" do
    get anime_news_url(@anime_news)
    assert_response :success
  end

  test "should get edit" do
    get edit_anime_news_url(@anime_news)
    assert_response :success
  end

  test "should update anime_news" do
    patch anime_news_url(@anime_news), params: { anime_news: { context: @anime_news.context, headline: @anime_news.headline } }
    assert_redirected_to anime_news_url(@anime_news)
  end

  test "should destroy anime_news" do
    assert_difference('AnimeNews.count', -1) do
      delete anime_news_url(@anime_news)
    end

    assert_redirected_to anime_news_index_url
  end
end
