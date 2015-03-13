require 'test_helper'

class OvmsControllerTest < ActionController::TestCase
  setup do
    @ovm = ovms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ovms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ovm" do
    assert_difference('Ovm.count') do
      post :create, ovm: { app_owner: @ovm.app_owner, application: @ovm.application, date_created: @ovm.date_created, disk_gb: @ovm.disk_gb, ip: @ovm.ip, mem_gb: @ovm.mem_gb, org: @ovm.org, os: @ovm.os, ovdc_id: @ovm.ovdc_id, own_email: @ovm.own_email, status: @ovm.status, vapp_desc: @ovm.vapp_desc, vapp_name: @ovm.vapp_name, vapp_status: @ovm.vapp_status, vm_desc: @ovm.vm_desc, vm_name: @ovm.vm_name }
    end

    assert_redirected_to ovm_path(assigns(:ovm))
  end

  test "should show ovm" do
    get :show, id: @ovm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ovm
    assert_response :success
  end

  test "should update ovm" do
    put :update, id: @ovm, ovm: { app_owner: @ovm.app_owner, application: @ovm.application, date_created: @ovm.date_created, disk_gb: @ovm.disk_gb, ip: @ovm.ip, mem_gb: @ovm.mem_gb, org: @ovm.org, os: @ovm.os, ovdc_id: @ovm.ovdc_id, own_email: @ovm.own_email, status: @ovm.status, vapp_desc: @ovm.vapp_desc, vapp_name: @ovm.vapp_name, vapp_status: @ovm.vapp_status, vm_desc: @ovm.vm_desc, vm_name: @ovm.vm_name }
    assert_redirected_to ovm_path(assigns(:ovm))
  end

  test "should destroy ovm" do
    assert_difference('Ovm.count', -1) do
      delete :destroy, id: @ovm
    end

    assert_redirected_to ovms_path
  end
end
