require 'test_helper'

class PortgroupsControllerTest < ActionController::TestCase
  setup do
    @portgroup = portgroups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portgroups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create portgroup" do
    assert_difference('Portgroup.count') do
      post :create, portgroup: { a_s: @portgroup.a_s, name: @portgroup.name, pnic_id: @portgroup.pnic_id, vcenter_id: @portgroup.vcenter_id, vdc_id: @portgroup.vdc_id, vmhost_id: @portgroup.vmhost_id, vswitch: @portgroup.vswitch, vswitch_id: @portgroup.vswitch_id }
    end

    assert_redirected_to portgroup_path(assigns(:portgroup))
  end

  test "should show portgroup" do
    get :show, id: @portgroup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @portgroup
    assert_response :success
  end

  test "should update portgroup" do
    put :update, id: @portgroup, portgroup: { a_s: @portgroup.a_s, name: @portgroup.name, pnic_id: @portgroup.pnic_id, vcenter_id: @portgroup.vcenter_id, vdc_id: @portgroup.vdc_id, vmhost_id: @portgroup.vmhost_id, vswitch: @portgroup.vswitch, vswitch_id: @portgroup.vswitch_id }
    assert_redirected_to portgroup_path(assigns(:portgroup))
  end

  test "should destroy portgroup" do
    assert_difference('Portgroup.count', -1) do
      delete :destroy, id: @portgroup
    end

    assert_redirected_to portgroups_path
  end
end
