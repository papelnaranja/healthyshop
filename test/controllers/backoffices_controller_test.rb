require 'test_helper'

class BackofficesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffices_index_url
    assert_response :success
  end

end
