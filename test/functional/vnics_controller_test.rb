require 'test_helper'

class VnicsControllerTest < ActionController::TestCase
  setup do
    @vnic = vnics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vnics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vnic" do
    assert_difference('Vnic.count') do
      post :create, vnic: { connect_state: @vnic.connect_state, macaddress: @vnic.macaddress, name: @vnic.name, portgroup_id: @vnic.portgroup_id, type: @vnic.type, vcenter_id: @vnic.vcenter_id, vm_id: @vnic.vm_id }
    end

    assert_redirected_to vnic_path(assigns(:vnic))
  end

  test "should show vnic" do
    get :show, id: @vnic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vnic
    assert_response :success
  end

  test "should update vnic" do
    put :update, id: @vnic, vnic: { connect_state: @vnic.connect_state, macaddress: @vnic.macaddress, name: @vnic.name, portgroup_id: @vnic.portgroup_id, type: @vnic.type, vcenter_id: @vnic.vcenter_id, vm_id: @vnic.vm_id }
    assert_redirected_to vnic_path(assigns(:vnic))
  end

  test "should destroy vnic" do
    assert_difference('Vnic.count', -1) do
      delete :destroy, id: @vnic
    end

    assert_redirected_to vnics_path
  end
end
