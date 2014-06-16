require 'test_helper'

class PnicsControllerTest < ActionController::TestCase
  setup do
    @pnic = pnics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pnics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pnic" do
    assert_difference('Pnic.count') do
      post :create, pnic: { macaddress: @pnic.macaddress, name: @pnic.name, network_port_id: @pnic.network_port_id, network_switch_id: @pnic.network_switch_id, observed: @pnic.observed, speed: @pnic.speed, vlan: @pnic.vlan, vmhost_id: @pnic.vmhost_id, vswitch_id: @pnic.vswitch_id }
    end

    assert_redirected_to pnic_path(assigns(:pnic))
  end

  test "should show pnic" do
    get :show, id: @pnic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pnic
    assert_response :success
  end

  test "should update pnic" do
    put :update, id: @pnic, pnic: { macaddress: @pnic.macaddress, name: @pnic.name, network_port_id: @pnic.network_port_id, network_switch_id: @pnic.network_switch_id, observed: @pnic.observed, speed: @pnic.speed, vlan: @pnic.vlan, vmhost_id: @pnic.vmhost_id, vswitch_id: @pnic.vswitch_id }
    assert_redirected_to pnic_path(assigns(:pnic))
  end

  test "should destroy pnic" do
    assert_difference('Pnic.count', -1) do
      delete :destroy, id: @pnic
    end

    assert_redirected_to pnics_path
  end
end
