require 'test_helper'

class F5VipsControllerTest < ActionController::TestCase
  setup do
    @f5_vip = f5_vips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:f5_vips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create f5_vip" do
    assert_difference('F5Vip.count') do
      post :create, f5_vip: { application_id: @f5_vip.application_id, f5_cluster_id: @f5_vip.f5_cluster_id, instance_id: @f5_vip.instance_id, ip: @f5_vip.ip, name: @f5_vip.name, port: @f5_vip.port, tier_id: @f5_vip.tier_id }
    end

    assert_redirected_to f5_vip_path(assigns(:f5_vip))
  end

  test "should show f5_vip" do
    get :show, id: @f5_vip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @f5_vip
    assert_response :success
  end

  test "should update f5_vip" do
    put :update, id: @f5_vip, f5_vip: { application_id: @f5_vip.application_id, f5_cluster_id: @f5_vip.f5_cluster_id, instance_id: @f5_vip.instance_id, ip: @f5_vip.ip, name: @f5_vip.name, port: @f5_vip.port, tier_id: @f5_vip.tier_id }
    assert_redirected_to f5_vip_path(assigns(:f5_vip))
  end

  test "should destroy f5_vip" do
    assert_difference('F5Vip.count', -1) do
      delete :destroy, id: @f5_vip
    end

    assert_redirected_to f5_vips_path
  end
end
