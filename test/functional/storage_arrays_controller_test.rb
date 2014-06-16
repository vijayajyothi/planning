require 'test_helper'

class StorageArraysControllerTest < ActionController::TestCase
  setup do
    @storage_array = storage_arrays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:storage_arrays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create storage_array" do
    assert_difference('StorageArray.count') do
      post :create, storage_array: { agent_revision: @storage_array.agent_revision, cabinet: @storage_array.cabinet, ip: @storage_array.ip, model: @storage_array.model, model_type: @storage_array.model_type, name: @storage_array.name, prom_revision: @storage_array.prom_revision, revision: @storage_array.revision, serial_no: @storage_array.serial_no, uid: @storage_array.uid }
    end

    assert_redirected_to storage_array_path(assigns(:storage_array))
  end

  test "should show storage_array" do
    get :show, id: @storage_array
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @storage_array
    assert_response :success
  end

  test "should update storage_array" do
    put :update, id: @storage_array, storage_array: { agent_revision: @storage_array.agent_revision, cabinet: @storage_array.cabinet, ip: @storage_array.ip, model: @storage_array.model, model_type: @storage_array.model_type, name: @storage_array.name, prom_revision: @storage_array.prom_revision, revision: @storage_array.revision, serial_no: @storage_array.serial_no, uid: @storage_array.uid }
    assert_redirected_to storage_array_path(assigns(:storage_array))
  end

  test "should destroy storage_array" do
    assert_difference('StorageArray.count', -1) do
      delete :destroy, id: @storage_array
    end

    assert_redirected_to storage_arrays_path
  end
end
