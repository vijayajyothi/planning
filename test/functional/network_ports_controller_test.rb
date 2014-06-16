require 'test_helper'

class NetworkPortsControllerTest < ActionController::TestCase
  setup do
    @network_port = network_ports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:network_ports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create network_port" do
    assert_difference('NetworkPort.count') do
      post :create, network_port: { alias: @network_port.alias, contact: @network_port.contact, full_duplex: @network_port.full_duplex, if_alias: @network_port.if_alias, if_index: @network_port.if_index, if_macaddress: @network_port.if_macaddress, if_name: @network_port.if_name, ip: @network_port.ip, name: @network_port.name, network_switch_id: @network_port.network_switch_id, object_id: @network_port.object_id, speed_in: @network_port.speed_in, speed_out: @network_port.speed_out, type: @network_port.type, unique_id: @network_port.unique_id }
    end

    assert_redirected_to network_port_path(assigns(:network_port))
  end

  test "should show network_port" do
    get :show, id: @network_port
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @network_port
    assert_response :success
  end

  test "should update network_port" do
    put :update, id: @network_port, network_port: { alias: @network_port.alias, contact: @network_port.contact, full_duplex: @network_port.full_duplex, if_alias: @network_port.if_alias, if_index: @network_port.if_index, if_macaddress: @network_port.if_macaddress, if_name: @network_port.if_name, ip: @network_port.ip, name: @network_port.name, network_switch_id: @network_port.network_switch_id, object_id: @network_port.object_id, speed_in: @network_port.speed_in, speed_out: @network_port.speed_out, type: @network_port.type, unique_id: @network_port.unique_id }
    assert_redirected_to network_port_path(assigns(:network_port))
  end

  test "should destroy network_port" do
    assert_difference('NetworkPort.count', -1) do
      delete :destroy, id: @network_port
    end

    assert_redirected_to network_ports_path
  end
end
