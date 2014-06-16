require 'test_helper'

class StorageProcessorsControllerTest < ActionController::TestCase
  setup do
    @storage_processor = storage_processors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:storage_processors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create storage_processor" do
    assert_difference('StorageProcessor.count') do
      post :create, storage_processor: { art_revision: @storage_processor.art_revision, assembly_name: @storage_processor.assembly_name, assy_revision: @storage_processor.assy_revision, cabinet: @storage_processor.cabinet, manufacture_date: @storage_processor.manufacture_date, manufacture_year: @storage_processor.manufacture_year, mem_size_kb: @storage_processor.mem_size_kb, name: @storage_processor.name, serial_no: @storage_processor.serial_no, storage_array_id: @storage_processor.storage_array_id, vendor_part_no: @storage_processor.vendor_part_no }
    end

    assert_redirected_to storage_processor_path(assigns(:storage_processor))
  end

  test "should show storage_processor" do
    get :show, id: @storage_processor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @storage_processor
    assert_response :success
  end

  test "should update storage_processor" do
    put :update, id: @storage_processor, storage_processor: { art_revision: @storage_processor.art_revision, assembly_name: @storage_processor.assembly_name, assy_revision: @storage_processor.assy_revision, cabinet: @storage_processor.cabinet, manufacture_date: @storage_processor.manufacture_date, manufacture_year: @storage_processor.manufacture_year, mem_size_kb: @storage_processor.mem_size_kb, name: @storage_processor.name, serial_no: @storage_processor.serial_no, storage_array_id: @storage_processor.storage_array_id, vendor_part_no: @storage_processor.vendor_part_no }
    assert_redirected_to storage_processor_path(assigns(:storage_processor))
  end

  test "should destroy storage_processor" do
    assert_difference('StorageProcessor.count', -1) do
      delete :destroy, id: @storage_processor
    end

    assert_redirected_to storage_processors_path
  end
end
