require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reviews_new_url
    assert_response :success
  end

  test "should get show" do
    get reviews_show_url
    assert_response :success
  end

  test "should get edit" do
    get reviews_edit_url
    assert_response :success
  end

  test "should get unification_view" do
    get reviews_unification_view_url
    assert_response :success
  end

end
