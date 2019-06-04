require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get games_top_url
    assert_response :success
  end

  test "should get new" do
    get games_new_url
    assert_response :success
  end

  test "should get search" do
    get games_search_url
    assert_response :success
  end

  test "should get search_name" do
    get games_search_name_url
    assert_response :success
  end

  test "should get index" do
    get games_index_url
    assert_response :success
  end

  test "should get show" do
    get games_show_url
    assert_response :success
  end

  test "should get reviews" do
    get games_reviews_url
    assert_response :success
  end

  test "should get edit" do
    get games_edit_url
    assert_response :success
  end

end
