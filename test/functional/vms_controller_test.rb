require 'test_helper'

class VmsControllerTest < ActionController::TestCase
  setup do
    @vm = vms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vm" do
    assert_difference('Vm.count') do
      post :create, vm: { application: @vm.application, boottime: @vm.boottime, cluster: @vm.cluster, connectionstate: @vm.connectionstate, createdby: @vm.createdby, createdtime: @vm.createdtime, datacenter: @vm.datacenter, folder: @vm.folder, guestfullname: @vm.guestfullname, gueststate: @vm.gueststate, hostname: @vm.hostname, ipaddress: @vm.ipaddress, memorymb: @vm.memorymb, numcpu: @vm.numcpu, persistentid: @vm.persistentid, powerstate: @vm.powerstate, provisionedspacegb: @vm.provisionedspacegb, qtynics: @vm.qtynics, reourcepool: @vm.reourcepool, storagecommitted: @vm.storagecommitted, storageuncommitted: @vm.storageuncommitted, suspendinterval: @vm.suspendinterval, suspendtime: @vm.suspendtime, toolsrunningstatus: @vm.toolsrunningstatus, toolstatus: @vm.toolstatus, toolsversion: @vm.toolsversion, usedspacegb: @vm.usedspacegb, vcserver: @vm.vcserver, version: @vm.version, vmhost: @vm.vmhost, vmname: @vm.vmname }
    end

    assert_redirected_to vm_path(assigns(:vm))
  end

  test "should show vm" do
    get :show, id: @vm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vm
    assert_response :success
  end

  test "should update vm" do
    put :update, id: @vm, vm: { application: @vm.application, boottime: @vm.boottime, cluster: @vm.cluster, connectionstate: @vm.connectionstate, createdby: @vm.createdby, createdtime: @vm.createdtime, datacenter: @vm.datacenter, folder: @vm.folder, guestfullname: @vm.guestfullname, gueststate: @vm.gueststate, hostname: @vm.hostname, ipaddress: @vm.ipaddress, memorymb: @vm.memorymb, numcpu: @vm.numcpu, persistentid: @vm.persistentid, powerstate: @vm.powerstate, provisionedspacegb: @vm.provisionedspacegb, qtynics: @vm.qtynics, reourcepool: @vm.reourcepool, storagecommitted: @vm.storagecommitted, storageuncommitted: @vm.storageuncommitted, suspendinterval: @vm.suspendinterval, suspendtime: @vm.suspendtime, toolsrunningstatus: @vm.toolsrunningstatus, toolstatus: @vm.toolstatus, toolsversion: @vm.toolsversion, usedspacegb: @vm.usedspacegb, vcserver: @vm.vcserver, version: @vm.version, vmhost: @vm.vmhost, vmname: @vm.vmname }
    assert_redirected_to vm_path(assigns(:vm))
  end

  test "should destroy vm" do
    assert_difference('Vm.count', -1) do
      delete :destroy, id: @vm
    end

    assert_redirected_to vms_path
  end
end
