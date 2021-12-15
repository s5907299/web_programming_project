require "test_helper"

class CommentAnimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment_anime = comment_animes(:one)
  end

  test "should get index" do
    get comment_animes_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_anime_url
    assert_response :success
  end

  test "should create comment_anime" do
    assert_difference('CommentAnime.count') do
      post comment_animes_url, params: { comment_anime: { anime_id: @comment_anime.anime_id, msg: @comment_anime.msg, user_id: @comment_anime.user_id } }
    end

    assert_redirected_to comment_anime_url(CommentAnime.last)
  end

  test "should show comment_anime" do
    get comment_anime_url(@comment_anime)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_anime_url(@comment_anime)
    assert_response :success
  end

  test "should update comment_anime" do
    patch comment_anime_url(@comment_anime), params: { comment_anime: { anime_id: @comment_anime.anime_id, msg: @comment_anime.msg, user_id: @comment_anime.user_id } }
    assert_redirected_to comment_anime_url(@comment_anime)
  end

  test "should destroy comment_anime" do
    assert_difference('CommentAnime.count', -1) do
      delete comment_anime_url(@comment_anime)
    end

    assert_redirected_to comment_animes_url
  end
end
