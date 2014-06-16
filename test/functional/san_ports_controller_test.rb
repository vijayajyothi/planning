require 'test_helper'

class SanPortsControllerTest < ActionController::TestCase
  setup do
    @san_port = san_ports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:san_ports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create san_port" do
    assert_difference('SanPort.count') do
      post :create, san_port: { index: @san_port.index, port: @san_port.port, port_type: @san_port.port_type, protocol: @san_port.protocol, san_switch_id: @san_port.san_switch_id, slot: @san_port.slot, speed: @san_port.speed, status: @san_port.status }
    end

    assert_redirected_to san_port_path(assigns(:san_port))
  end

  test "should show san_port" do
    get :show, id: @san_port
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @san_port
    assert_response :success
  end

  test "should update san_port" do
    put :update, id: @san_port, san_port: { index: @san_port.index, port: @san_port.port, port_type: @san_port.port_type, protocol: @san_port.protocol, san_switch_id: @san_port.san_switch_id, slot: @san_port.slot, speed: @san_port.speed, status: @san_port.status }
    assert_redirected_to san_port_path(assigns(:san_port))
  end

  test "should destroy san_port" do
    assert_difference('SanPort.count', -1) do
      delete :destroy, id: @san_port
    end

    assert_redirected_to san_ports_path
  end
end
