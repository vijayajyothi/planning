require 'test_helper'

class NetworkSwitchesControllerTest < ActionController::TestCase
  setup do
    @network_switch = network_switches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:network_switches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create network_switch" do
    assert_difference('NetworkSwitch.count') do
      post :create, network_switch: { contact: @network_switch.contact, description: @network_switch.description, device_type: @network_switch.device_type, ip: @network_switch.ip, location: @network_switch.location, model: @network_switch.model, name: @network_switch.name, serial_no: @network_switch.serial_no, unique_id: @network_switch.unique_id, vendor: @network_switch.vendor, version: @network_switch.version }
    end

    assert_redirected_to network_switch_path(assigns(:network_switch))
  end

  test "should show network_switch" do
    get :show, id: @network_switch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @network_switch
    assert_response :success
  end

  test "should update network_switch" do
    put :update, id: @network_switch, network_switch: { contact: @network_switch.contact, description: @network_switch.description, device_type: @network_switch.device_type, ip: @network_switch.ip, location: @network_switch.location, model: @network_switch.model, name: @network_switch.name, serial_no: @network_switch.serial_no, unique_id: @network_switch.unique_id, vendor: @network_switch.vendor, version: @network_switch.version }
    assert_redirected_to network_switch_path(assigns(:network_switch))
  end

  test "should destroy network_switch" do
    assert_difference('NetworkSwitch.count', -1) do
      delete :destroy, id: @network_switch
    end

    assert_redirected_to network_switches_path
  end
end
