require 'test_helper'

class CarouselControllerTest < ActionDispatch::IntegrationTest
  test "should get preview" do
    get carousel_preview_url
    assert_response :success
  end

  test "should get configure" do
    get carousel_configure_url
    assert_response :success
  end

end
