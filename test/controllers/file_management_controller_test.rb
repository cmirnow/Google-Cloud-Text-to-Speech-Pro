require "test_helper"

class FileManagementControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get file_management_index_url
    assert_response :success
  end
end
