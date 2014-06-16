require 'test_helper'

class StorageLunsControllerTest < ActionController::TestCase
  setup do
    @storage_lun = storage_luns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:storage_luns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create storage_lun" do
    assert_difference('StorageLun.count') do
      post :create, storage_lun: { capacity_mb: @storage_lun.capacity_mb, device_type: @storage_lun.device_type, lun: @storage_lun.lun, lun_name: @storage_lun.lun_name, lun_no: @storage_lun.lun_no, raid_type: @storage_lun.raid_type, storage_array_id: @storage_lun.storage_array_id }
    end

    assert_redirected_to storage_lun_path(assigns(:storage_lun))
  end

  test "should show storage_lun" do
    get :show, id: @storage_lun
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @storage_lun
    assert_response :success
  end

  test "should update storage_lun" do
    put :update, id: @storage_lun, storage_lun: { capacity_mb: @storage_lun.capacity_mb, device_type: @storage_lun.device_type, lun: @storage_lun.lun, lun_name: @storage_lun.lun_name, lun_no: @storage_lun.lun_no, raid_type: @storage_lun.raid_type, storage_array_id: @storage_lun.storage_array_id }
    assert_redirected_to storage_lun_path(assigns(:storage_lun))
  end

  test "should destroy storage_lun" do
    assert_difference('StorageLun.count', -1) do
      delete :destroy, id: @storage_lun
    end

    assert_redirected_to storage_luns_path
  end
end
