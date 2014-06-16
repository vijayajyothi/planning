require 'test_helper'

class VmhostsControllerTest < ActionController::TestCase
  setup do
    @vmhost = vmhosts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vmhosts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vmhost" do
    assert_difference('Vmhost.count') do
      post :create, vmhost: { bios_version: @vmhost.bios_version, cluster_id: @vmhost.cluster_id, connection_state: @vmhost.connection_state, cpu_model: @vmhost.cpu_model, cpu_total_mhz: @vmhost.cpu_total_mhz, esx_api_version: @vmhost.esx_api_version, esx_build: @vmhost.esx_build, esx_product: @vmhost.esx_product, esx_version: @vmhost.esx_version, host_id: @vmhost.host_id, hw_device_id: @vmhost.hw_device_id, ip: @vmhost.ip, is_standalone: @vmhost.is_standalone, mem_total_mb: @vmhost.mem_total_mb, model: @vmhost.model, name: @vmhost.name, num_core: @vmhost.num_core, num_cpu: @vmhost.num_cpu, parent_id: @vmhost.parent_id, power_state: @vmhost.power_state, serial_no: @vmhost.serial_no, uuid: @vmhost.uuid, vcenter_id: @vmhost.vcenter_id, vendor: @vmhost.vendor }
    end

    assert_redirected_to vmhost_path(assigns(:vmhost))
  end

  test "should show vmhost" do
    get :show, id: @vmhost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vmhost
    assert_response :success
  end

  test "should update vmhost" do
    put :update, id: @vmhost, vmhost: { bios_version: @vmhost.bios_version, cluster_id: @vmhost.cluster_id, connection_state: @vmhost.connection_state, cpu_model: @vmhost.cpu_model, cpu_total_mhz: @vmhost.cpu_total_mhz, esx_api_version: @vmhost.esx_api_version, esx_build: @vmhost.esx_build, esx_product: @vmhost.esx_product, esx_version: @vmhost.esx_version, host_id: @vmhost.host_id, hw_device_id: @vmhost.hw_device_id, ip: @vmhost.ip, is_standalone: @vmhost.is_standalone, mem_total_mb: @vmhost.mem_total_mb, model: @vmhost.model, name: @vmhost.name, num_core: @vmhost.num_core, num_cpu: @vmhost.num_cpu, parent_id: @vmhost.parent_id, power_state: @vmhost.power_state, serial_no: @vmhost.serial_no, uuid: @vmhost.uuid, vcenter_id: @vmhost.vcenter_id, vendor: @vmhost.vendor }
    assert_redirected_to vmhost_path(assigns(:vmhost))
  end

  test "should destroy vmhost" do
    assert_difference('Vmhost.count', -1) do
      delete :destroy, id: @vmhost
    end

    assert_redirected_to vmhosts_path
  end
end
