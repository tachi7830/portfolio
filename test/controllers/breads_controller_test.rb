require 'test_helper'

class BreadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get breads_index_url
    assert_response :success
  end

end
