require "test_helper"

class CommentNewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment_news = comment_news(:one)
  end

  test "should get index" do
    get comment_news_index_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_news_url
    assert_response :success
  end

  test "should create comment_news" do
    assert_difference('CommentNews.count') do
      post comment_news_index_url, params: { comment_news: { anime_news_id: @comment_news.anime_news_id, msg: @comment_news.msg, user_id: @comment_news.user_id } }
    end

    assert_redirected_to comment_news_url(CommentNews.last)
  end

  test "should show comment_news" do
    get comment_news_url(@comment_news)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_news_url(@comment_news)
    assert_response :success
  end

  test "should update comment_news" do
    patch comment_news_url(@comment_news), params: { comment_news: { anime_news_id: @comment_news.anime_news_id, msg: @comment_news.msg, user_id: @comment_news.user_id } }
    assert_redirected_to comment_news_url(@comment_news)
  end

  test "should destroy comment_news" do
    assert_difference('CommentNews.count', -1) do
      delete comment_news_url(@comment_news)
    end

    assert_redirected_to comment_news_index_url
  end
end
