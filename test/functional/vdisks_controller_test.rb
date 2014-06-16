require 'test_helper'

class VdisksControllerTest < ActionController::TestCase
  setup do
    @vdisk = vdisks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vdisks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vdisk" do
    assert_difference('Vdisk.count') do
      post :create, vdisk: { capacitykb: @vdisk.capacitykb, datastore_id: @vdisk.datastore_id, filename: @vdisk.filename, format: @vdisk.format, name: @vdisk.name, persistence: @vdisk.persistence, type: @vdisk.type, vcenter_id: @vdisk.vcenter_id, vm_id: @vdisk.vm_id }
    end

    assert_redirected_to vdisk_path(assigns(:vdisk))
  end

  test "should show vdisk" do
    get :show, id: @vdisk
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vdisk
    assert_response :success
  end

  test "should update vdisk" do
    put :update, id: @vdisk, vdisk: { capacitykb: @vdisk.capacitykb, datastore_id: @vdisk.datastore_id, filename: @vdisk.filename, format: @vdisk.format, name: @vdisk.name, persistence: @vdisk.persistence, type: @vdisk.type, vcenter_id: @vdisk.vcenter_id, vm_id: @vdisk.vm_id }
    assert_redirected_to vdisk_path(assigns(:vdisk))
  end

  test "should destroy vdisk" do
    assert_difference('Vdisk.count', -1) do
      delete :destroy, id: @vdisk
    end

    assert_redirected_to vdisks_path
  end
end
