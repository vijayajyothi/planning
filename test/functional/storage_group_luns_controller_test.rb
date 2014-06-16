require 'test_helper'

class StorageGroupLunsControllerTest < ActionController::TestCase
  setup do
    @storage_group_lun = storage_group_luns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:storage_group_luns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create storage_group_lun" do
    assert_difference('StorageGroupLun.count') do
      post :create, storage_group_lun: { host_lun: @storage_group_lun.host_lun, storage_group_id: @storage_group_lun.storage_group_id, storage_lun_id: @storage_group_lun.storage_lun_id }
    end

    assert_redirected_to storage_group_lun_path(assigns(:storage_group_lun))
  end

  test "should show storage_group_lun" do
    get :show, id: @storage_group_lun
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @storage_group_lun
    assert_response :success
  end

  test "should update storage_group_lun" do
    put :update, id: @storage_group_lun, storage_group_lun: { host_lun: @storage_group_lun.host_lun, storage_group_id: @storage_group_lun.storage_group_id, storage_lun_id: @storage_group_lun.storage_lun_id }
    assert_redirected_to storage_group_lun_path(assigns(:storage_group_lun))
  end

  test "should destroy storage_group_lun" do
    assert_difference('StorageGroupLun.count', -1) do
      delete :destroy, id: @storage_group_lun
    end

    assert_redirected_to storage_group_luns_path
  end
end
