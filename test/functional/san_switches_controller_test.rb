require 'test_helper'

class SanSwitchesControllerTest < ActionController::TestCase
  setup do
    @san_switch = san_switches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:san_switches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create san_switch" do
    assert_difference('SanSwitch.count') do
      post :create, san_switch: { boot_prom: @san_switch.boot_prom, domain: @san_switch.domain, fabric_os: @san_switch.fabric_os, factory_part_no: @san_switch.factory_part_no, ip: @san_switch.ip, kernel: @san_switch.kernel, model: @san_switch.model, name: @san_switch.name, part_no: @san_switch.part_no, serial_no: @san_switch.serial_no, state: @san_switch.state, switch_id: @san_switch.switch_id, switch_type: @san_switch.switch_type, vendor: @san_switch.vendor, wwn: @san_switch.wwn }
    end

    assert_redirected_to san_switch_path(assigns(:san_switch))
  end

  test "should show san_switch" do
    get :show, id: @san_switch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @san_switch
    assert_response :success
  end

  test "should update san_switch" do
    put :update, id: @san_switch, san_switch: { boot_prom: @san_switch.boot_prom, domain: @san_switch.domain, fabric_os: @san_switch.fabric_os, factory_part_no: @san_switch.factory_part_no, ip: @san_switch.ip, kernel: @san_switch.kernel, model: @san_switch.model, name: @san_switch.name, part_no: @san_switch.part_no, serial_no: @san_switch.serial_no, state: @san_switch.state, switch_id: @san_switch.switch_id, switch_type: @san_switch.switch_type, vendor: @san_switch.vendor, wwn: @san_switch.wwn }
    assert_redirected_to san_switch_path(assigns(:san_switch))
  end

  test "should destroy san_switch" do
    assert_difference('SanSwitch.count', -1) do
      delete :destroy, id: @san_switch
    end

    assert_redirected_to san_switches_path
  end
end
