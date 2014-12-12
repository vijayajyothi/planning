require 'test_helper'

class F5DevicesControllerTest < ActionController::TestCase
  setup do
    @f5_device = f5_devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:f5_devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create f5_device" do
    assert_difference('F5Device.count') do
      post :create, f5_device: { device: @f5_device.device, ip: @f5_device.ip, status: @f5_device.status }
    end

    assert_redirected_to f5_device_path(assigns(:f5_device))
  end

  test "should show f5_device" do
    get :show, id: @f5_device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @f5_device
    assert_response :success
  end

  test "should update f5_device" do
    put :update, id: @f5_device, f5_device: { device: @f5_device.device, ip: @f5_device.ip, status: @f5_device.status }
    assert_redirected_to f5_device_path(assigns(:f5_device))
  end

  test "should destroy f5_device" do
    assert_difference('F5Device.count', -1) do
      delete :destroy, id: @f5_device
    end

    assert_redirected_to f5_devices_path
  end
end
