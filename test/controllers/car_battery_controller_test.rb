require "test_helper"

class CarBatteryControllerTest < ActionDispatch::IntegrationTest
  test "should get showbattery" do
    get car_battery_showbattery_url
    assert_response :success
  end
end
