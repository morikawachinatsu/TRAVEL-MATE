require "test_helper"

class SongsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get songs_search_url
    assert_response :success
  end

  test "should get show" do
    get songs_show_url
    assert_response :success
  end

  test "should get artist" do
    get songs_artist_url
    assert_response :success
  end

  test "should get album" do
    get songs_album_url
    assert_response :success
  end
end
