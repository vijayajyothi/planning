require 'test_helper'

class PhysicalDisksControllerTest < ActionController::TestCase
  setup do
    @physical_disk = physical_disks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:physical_disks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create physical_disk" do
    assert_difference('PhysicalDisk.count') do
      post :create, physical_disk: { capacity_mb: @physical_disk.capacity_mb, disk_type: @physical_disk.disk_type, name: @physical_disk.name, product_id: @physical_disk.product_id, revision: @physical_disk.revision, serial_no: @physical_disk.serial_no, speed: @physical_disk.speed, storage_array_id: @physical_disk.storage_array_id, storage_dae_id: @physical_disk.storage_dae_id, user_capacity_mb: @physical_disk.user_capacity_mb, vendor: @physical_disk.vendor }
    end

    assert_redirected_to physical_disk_path(assigns(:physical_disk))
  end

  test "should show physical_disk" do
    get :show, id: @physical_disk
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @physical_disk
    assert_response :success
  end

  test "should update physical_disk" do
    put :update, id: @physical_disk, physical_disk: { capacity_mb: @physical_disk.capacity_mb, disk_type: @physical_disk.disk_type, name: @physical_disk.name, product_id: @physical_disk.product_id, revision: @physical_disk.revision, serial_no: @physical_disk.serial_no, speed: @physical_disk.speed, storage_array_id: @physical_disk.storage_array_id, storage_dae_id: @physical_disk.storage_dae_id, user_capacity_mb: @physical_disk.user_capacity_mb, vendor: @physical_disk.vendor }
    assert_redirected_to physical_disk_path(assigns(:physical_disk))
  end

  test "should destroy physical_disk" do
    assert_difference('PhysicalDisk.count', -1) do
      delete :destroy, id: @physical_disk
    end

    assert_redirected_to physical_disks_path
  end
end
