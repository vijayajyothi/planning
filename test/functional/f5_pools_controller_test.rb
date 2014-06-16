require 'test_helper'

class F5PoolsControllerTest < ActionController::TestCase
  setup do
    @f5_pool = f5_pools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:f5_pools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create f5_pool" do
    assert_difference('F5Pool.count') do
      post :create, f5_pool: { f5_cluster_id: @f5_pool.f5_cluster_id, f5_vip_id: @f5_pool.f5_vip_id, lb_method: @f5_pool.lb_method, name: @f5_pool.name }
    end

    assert_redirected_to f5_pool_path(assigns(:f5_pool))
  end

  test "should show f5_pool" do
    get :show, id: @f5_pool
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @f5_pool
    assert_response :success
  end

  test "should update f5_pool" do
    put :update, id: @f5_pool, f5_pool: { f5_cluster_id: @f5_pool.f5_cluster_id, f5_vip_id: @f5_pool.f5_vip_id, lb_method: @f5_pool.lb_method, name: @f5_pool.name }
    assert_redirected_to f5_pool_path(assigns(:f5_pool))
  end

  test "should destroy f5_pool" do
    assert_difference('F5Pool.count', -1) do
      delete :destroy, id: @f5_pool
    end

    assert_redirected_to f5_pools_path
  end
end
