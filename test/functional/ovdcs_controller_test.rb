require 'test_helper'

class OvdcsControllerTest < ActionController::TestCase
  setup do
    @ovdc = ovdcs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ovdcs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ovdc" do
    assert_difference('Ovdc.count') do
      post :create, ovdc: { cpu_alloc: @ovdc.cpu_alloc, cpu_limit: @ovdc.cpu_limit, cpu_pct: @ovdc.cpu_pct, cpu_used: @ovdc.cpu_used, mem_alloc: @ovdc.mem_alloc, mem_free: @ovdc.mem_free, mem_limit: @ovdc.mem_limit, mem_pct: @ovdc.mem_pct, mem_used: @ovdc.mem_used, org: @ovdc.org, ovdc: @ovdc.ovdc, st_alloc: @ovdc.st_alloc, st_free: @ovdc.st_free, st_limit: @ovdc.st_limit, st_used: @ovdc.st_used, storage_pct: @ovdc.storage_pct }
    end

    assert_redirected_to ovdc_path(assigns(:ovdc))
  end

  test "should show ovdc" do
    get :show, id: @ovdc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ovdc
    assert_response :success
  end

  test "should update ovdc" do
    put :update, id: @ovdc, ovdc: { cpu_alloc: @ovdc.cpu_alloc, cpu_limit: @ovdc.cpu_limit, cpu_pct: @ovdc.cpu_pct, cpu_used: @ovdc.cpu_used, mem_alloc: @ovdc.mem_alloc, mem_free: @ovdc.mem_free, mem_limit: @ovdc.mem_limit, mem_pct: @ovdc.mem_pct, mem_used: @ovdc.mem_used, org: @ovdc.org, ovdc: @ovdc.ovdc, st_alloc: @ovdc.st_alloc, st_free: @ovdc.st_free, st_limit: @ovdc.st_limit, st_used: @ovdc.st_used, storage_pct: @ovdc.storage_pct }
    assert_redirected_to ovdc_path(assigns(:ovdc))
  end

  test "should destroy ovdc" do
    assert_difference('Ovdc.count', -1) do
      delete :destroy, id: @ovdc
    end

    assert_redirected_to ovdcs_path
  end
end
