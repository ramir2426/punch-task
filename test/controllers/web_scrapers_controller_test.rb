require 'test_helper'

class WebScrapersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get web_scrapers_index_url
    assert_response :success
  end

end
