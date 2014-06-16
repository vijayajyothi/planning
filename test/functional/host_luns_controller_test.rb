require 'test_helper'

class HostLunsControllerTest < ActionController::TestCase
  setup do
    @host_lun = host_luns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:host_luns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create host_lun" do
    assert_difference('HostLun.count') do
      post :create, host_lun: { hhba_id: @host_lun.hhba_id, lun_no: @host_lun.lun_no, storage_array_id: @host_lun.storage_array_id, storage_group_id: @host_lun.storage_group_id, storage_lun_id: @host_lun.storage_lun_id, vmhost_id: @host_lun.vmhost_id }
    end

    assert_redirected_to host_lun_path(assigns(:host_lun))
  end

  test "should show host_lun" do
    get :show, id: @host_lun
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @host_lun
    assert_response :success
  end

  test "should update host_lun" do
    put :update, id: @host_lun, host_lun: { hhba_id: @host_lun.hhba_id, lun_no: @host_lun.lun_no, storage_array_id: @host_lun.storage_array_id, storage_group_id: @host_lun.storage_group_id, storage_lun_id: @host_lun.storage_lun_id, vmhost_id: @host_lun.vmhost_id }
    assert_redirected_to host_lun_path(assigns(:host_lun))
  end

  test "should destroy host_lun" do
    assert_difference('HostLun.count', -1) do
      delete :destroy, id: @host_lun
    end

    assert_redirected_to host_luns_path
  end
end
