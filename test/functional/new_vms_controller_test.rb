require 'test_helper'

class NewVmsControllerTest < ActionController::TestCase
  setup do
    @new_vm = new_vms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:new_vms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create new_vm" do
    assert_difference('NewVm.count') do
      post :create, new_vm: { application_id: @new_vm.application_id, backup: @new_vm.backup, cluster_id: @new_vm.cluster_id, connection_state: @new_vm.connection_state, created_by: @new_vm.created_by, created_time: @new_vm.created_time, folder_id: @new_vm.folder_id, hw_version: @new_vm.hw_version, hz_numer: @new_vm.hz_numer, instance_id: @new_vm.instance_id, ip: @new_vm.ip, is_cloud: @new_vm.is_cloud, last_boot: @new_vm.last_boot, last_change: @new_vm.last_change, last_suspend: @new_vm.last_suspend, last_suspend_interval: @new_vm.last_suspend_interval, name: @new_vm.name, num_cpus: @new_vm.num_cpus, num_vnics: @new_vm.num_vnics, os: @new_vm.os, owner: @new_vm.owner, persistent_id: @new_vm.persistent_id, power_state: @new_vm.power_state, ppm_no: @new_vm.ppm_no, resource_pool: @new_vm.resource_pool, status: @new_vm.status, tier_id: @new_vm.tier_id, tools_status: @new_vm.tools_status, tools_version: @new_vm.tools_version, total_mem_mb: @new_vm.total_mem_mb, uuid: @new_vm.uuid, vcenter_id: @new_vm.vcenter_id, vdc_id: @new_vm.vdc_id, version: @new_vm.version, vm_hostname: @new_vm.vm_hostname, vm_id: @new_vm.vm_id, vmhost_id: @new_vm.vmhost_id }
    end

    assert_redirected_to new_vm_path(assigns(:new_vm))
  end

  test "should show new_vm" do
    get :show, id: @new_vm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @new_vm
    assert_response :success
  end

  test "should update new_vm" do
    put :update, id: @new_vm, new_vm: { application_id: @new_vm.application_id, backup: @new_vm.backup, cluster_id: @new_vm.cluster_id, connection_state: @new_vm.connection_state, created_by: @new_vm.created_by, created_time: @new_vm.created_time, folder_id: @new_vm.folder_id, hw_version: @new_vm.hw_version, hz_numer: @new_vm.hz_numer, instance_id: @new_vm.instance_id, ip: @new_vm.ip, is_cloud: @new_vm.is_cloud, last_boot: @new_vm.last_boot, last_change: @new_vm.last_change, last_suspend: @new_vm.last_suspend, last_suspend_interval: @new_vm.last_suspend_interval, name: @new_vm.name, num_cpus: @new_vm.num_cpus, num_vnics: @new_vm.num_vnics, os: @new_vm.os, owner: @new_vm.owner, persistent_id: @new_vm.persistent_id, power_state: @new_vm.power_state, ppm_no: @new_vm.ppm_no, resource_pool: @new_vm.resource_pool, status: @new_vm.status, tier_id: @new_vm.tier_id, tools_status: @new_vm.tools_status, tools_version: @new_vm.tools_version, total_mem_mb: @new_vm.total_mem_mb, uuid: @new_vm.uuid, vcenter_id: @new_vm.vcenter_id, vdc_id: @new_vm.vdc_id, version: @new_vm.version, vm_hostname: @new_vm.vm_hostname, vm_id: @new_vm.vm_id, vmhost_id: @new_vm.vmhost_id }
    assert_redirected_to new_vm_path(assigns(:new_vm))
  end

  test "should destroy new_vm" do
    assert_difference('NewVm.count', -1) do
      delete :destroy, id: @new_vm
    end

    assert_redirected_to new_vms_path
  end
end
