require "test_helper"

class MtlEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mtl_events_index_url
    assert_response :success
  end

  test "should get show" do
    get mtl_events_show_url
    assert_response :success
  end
end
