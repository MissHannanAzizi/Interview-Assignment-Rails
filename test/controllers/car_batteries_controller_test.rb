require "test_helper"

class CarBatteriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get car_batteries_index_url
    assert_response :success
  end
end
