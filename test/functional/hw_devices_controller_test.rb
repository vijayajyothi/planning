require 'test_helper'

class HwDevicesControllerTest < ActionController::TestCase
  setup do
    @hw_device = hw_devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hw_devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hw_device" do
    assert_difference('HwDevice.count') do
      post :create, hw_device: { asset_no: @hw_device.asset_no, assigned_by: @hw_device.assigned_by, building: @hw_device.building, console: @hw_device.console, console_ip: @hw_device.console_ip, cost_center: @hw_device.cost_center, country: @hw_device.country, floor: @hw_device.floor, hostname: @hw_device.hostname, ip: @hw_device.ip, manufacturer: @hw_device.manufacturer, model: @hw_device.model, name: @hw_device.name, owned_by: @hw_device.owned_by, room: @hw_device.room, ru_position: @hw_device.ru_position, ru_size: @hw_device.ru_size, serial_no: @hw_device.serial_no, state: @hw_device.state, status: @hw_device.status, type: @hw_device.type }
    end

    assert_redirected_to hw_device_path(assigns(:hw_device))
  end

  test "should show hw_device" do
    get :show, id: @hw_device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hw_device
    assert_response :success
  end

  test "should update hw_device" do
    put :update, id: @hw_device, hw_device: { asset_no: @hw_device.asset_no, assigned_by: @hw_device.assigned_by, building: @hw_device.building, console: @hw_device.console, console_ip: @hw_device.console_ip, cost_center: @hw_device.cost_center, country: @hw_device.country, floor: @hw_device.floor, hostname: @hw_device.hostname, ip: @hw_device.ip, manufacturer: @hw_device.manufacturer, model: @hw_device.model, name: @hw_device.name, owned_by: @hw_device.owned_by, room: @hw_device.room, ru_position: @hw_device.ru_position, ru_size: @hw_device.ru_size, serial_no: @hw_device.serial_no, state: @hw_device.state, status: @hw_device.status, type: @hw_device.type }
    assert_redirected_to hw_device_path(assigns(:hw_device))
  end

  test "should destroy hw_device" do
    assert_difference('HwDevice.count', -1) do
      delete :destroy, id: @hw_device
    end

    assert_redirected_to hw_devices_path
  end
end
