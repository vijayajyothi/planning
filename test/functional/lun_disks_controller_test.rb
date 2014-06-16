require 'test_helper'

class LunDisksControllerTest < ActionController::TestCase
  setup do
    @lun_disk = lun_disks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lun_disks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lun_disk" do
    assert_difference('LunDisk.count') do
      post :create, lun_disk: { physical_disk_id: @lun_disk.physical_disk_id, storage_lun_id: @lun_disk.storage_lun_id }
    end

    assert_redirected_to lun_disk_path(assigns(:lun_disk))
  end

  test "should show lun_disk" do
    get :show, id: @lun_disk
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lun_disk
    assert_response :success
  end

  test "should update lun_disk" do
    put :update, id: @lun_disk, lun_disk: { physical_disk_id: @lun_disk.physical_disk_id, storage_lun_id: @lun_disk.storage_lun_id }
    assert_redirected_to lun_disk_path(assigns(:lun_disk))
  end

  test "should destroy lun_disk" do
    assert_difference('LunDisk.count', -1) do
      delete :destroy, id: @lun_disk
    end

    assert_redirected_to lun_disks_path
  end
end
