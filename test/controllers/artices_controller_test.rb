require "test_helper"

class ArticesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artice = artices(:one)
  end

  test "should get index" do
    get artices_url
    assert_response :success
  end

  test "should get new" do
    get new_artice_url
    assert_response :success
  end

  test "should create artice" do
    assert_difference("Artice.count") do
      post artices_url, params: { artice: { body: @artice.body, title: @artice.title } }
    end

    assert_redirected_to artice_url(Artice.last)
  end

  test "should show artice" do
    get artice_url(@artice)
    assert_response :success
  end

  test "should get edit" do
    get edit_artice_url(@artice)
    assert_response :success
  end

  test "should update artice" do
    patch artice_url(@artice), params: { artice: { body: @artice.body, title: @artice.title } }
    assert_redirected_to artice_url(@artice)
  end

  test "should destroy artice" do
    assert_difference("Artice.count", -1) do
      delete artice_url(@artice)
    end

    assert_redirected_to artices_url
  end
end
