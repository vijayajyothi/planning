require 'test_helper'

class StorageDaesControllerTest < ActionController::TestCase
  setup do
    @storage_dae = storage_daes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:storage_daes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create storage_dae" do
    assert_difference('StorageDae.count') do
      post :create, storage_dae: { art_revision: @storage_dae.art_revision, assembly_name: @storage_dae.assembly_name, assy_revision: @storage_dae.assy_revision, manufacture_date: @storage_dae.manufacture_date, name: @storage_dae.name, serial_no: @storage_dae.serial_no, storage_array_id: @storage_dae.storage_array_id, vendor_part_no: @storage_dae.vendor_part_no }
    end

    assert_redirected_to storage_dae_path(assigns(:storage_dae))
  end

  test "should show storage_dae" do
    get :show, id: @storage_dae
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @storage_dae
    assert_response :success
  end

  test "should update storage_dae" do
    put :update, id: @storage_dae, storage_dae: { art_revision: @storage_dae.art_revision, assembly_name: @storage_dae.assembly_name, assy_revision: @storage_dae.assy_revision, manufacture_date: @storage_dae.manufacture_date, name: @storage_dae.name, serial_no: @storage_dae.serial_no, storage_array_id: @storage_dae.storage_array_id, vendor_part_no: @storage_dae.vendor_part_no }
    assert_redirected_to storage_dae_path(assigns(:storage_dae))
  end

  test "should destroy storage_dae" do
    assert_difference('StorageDae.count', -1) do
      delete :destroy, id: @storage_dae
    end

    assert_redirected_to storage_daes_path
  end
end
