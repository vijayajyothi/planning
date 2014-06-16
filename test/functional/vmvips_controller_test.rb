require 'test_helper'

class VmvipsControllerTest < ActionController::TestCase
  setup do
    @vmvip = vmvips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vmvips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vmvip" do
    assert_difference('Vmvip.count') do
      post :create, vmvip: { f5_vip_id: @vmvip.f5_vip_id, vm_id: @vmvip.vm_id }
    end

    assert_redirected_to vmvip_path(assigns(:vmvip))
  end

  test "should show vmvip" do
    get :show, id: @vmvip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vmvip
    assert_response :success
  end

  test "should update vmvip" do
    put :update, id: @vmvip, vmvip: { f5_vip_id: @vmvip.f5_vip_id, vm_id: @vmvip.vm_id }
    assert_redirected_to vmvip_path(assigns(:vmvip))
  end

  test "should destroy vmvip" do
    assert_difference('Vmvip.count', -1) do
      delete :destroy, id: @vmvip
    end

    assert_redirected_to vmvips_path
  end
end
