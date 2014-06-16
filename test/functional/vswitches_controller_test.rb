require 'test_helper'

class VswitchesControllerTest < ActionController::TestCase
  setup do
    @vswitch = vswitches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vswitches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vswitch" do
    assert_difference('Vswitch.count') do
      post :create, vswitch: { name: @vswitch.name, vcenter_id: @vswitch.vcenter_id, vdc_id: @vswitch.vdc_id, vmhost_id: @vswitch.vmhost_id }
    end

    assert_redirected_to vswitch_path(assigns(:vswitch))
  end

  test "should show vswitch" do
    get :show, id: @vswitch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vswitch
    assert_response :success
  end

  test "should update vswitch" do
    put :update, id: @vswitch, vswitch: { name: @vswitch.name, vcenter_id: @vswitch.vcenter_id, vdc_id: @vswitch.vdc_id, vmhost_id: @vswitch.vmhost_id }
    assert_redirected_to vswitch_path(assigns(:vswitch))
  end

  test "should destroy vswitch" do
    assert_difference('Vswitch.count', -1) do
      delete :destroy, id: @vswitch
    end

    assert_redirected_to vswitches_path
  end
end
