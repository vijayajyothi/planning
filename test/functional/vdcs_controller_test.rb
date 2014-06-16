require 'test_helper'

class VdcsControllerTest < ActionController::TestCase
  setup do
    @vdc = vdcs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vdcs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vdc" do
    assert_difference('Vdc.count') do
      post :create, vdc: { description: @vdc.description, folder_id: @vdc.folder_id, name: @vdc.name, vcenter_id: @vdc.vcenter_id }
    end

    assert_redirected_to vdc_path(assigns(:vdc))
  end

  test "should show vdc" do
    get :show, id: @vdc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vdc
    assert_response :success
  end

  test "should update vdc" do
    put :update, id: @vdc, vdc: { description: @vdc.description, folder_id: @vdc.folder_id, name: @vdc.name, vcenter_id: @vdc.vcenter_id }
    assert_redirected_to vdc_path(assigns(:vdc))
  end

  test "should destroy vdc" do
    assert_difference('Vdc.count', -1) do
      delete :destroy, id: @vdc
    end

    assert_redirected_to vdcs_path
  end
end
