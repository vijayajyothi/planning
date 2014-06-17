require 'test_helper'

class StorageGroupsControllerTest < ActionController::TestCase
  setup do
    @storage_group = storage_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:storage_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create storage_group" do
    assert_difference('StorageGroup.count') do
      post :create, storage_group: { hhba_id: @storage_group.hhba_id, name: @storage_group.name, storage_array_id: @storage_group.storage_array_id, vmhost_id: @storage_group.vmhost_id }
    end

    assert_redirected_to storage_group_path(assigns(:storage_group))
  end

  test "should show storage_group" do
    get :show, id: @storage_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @storage_group
    assert_response :success
  end

  test "should update storage_group" do
    put :update, id: @storage_group, storage_group: { hhba_id: @storage_group.hhba_id, name: @storage_group.name, storage_array_id: @storage_group.storage_array_id, vmhost_id: @storage_group.vmhost_id }
    assert_redirected_to storage_group_path(assigns(:storage_group))
  end

  test "should destroy storage_group" do
    assert_difference('StorageGroup.count', -1) do
      delete :destroy, id: @storage_group
    end

    assert_redirected_to storage_groups_path
  end
end
