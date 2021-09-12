require 'test_helper'

class ConversionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get conversion_index_url
    assert_response :success
  end

end
