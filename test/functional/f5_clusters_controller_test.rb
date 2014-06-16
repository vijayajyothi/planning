require 'test_helper'

class F5ClustersControllerTest < ActionController::TestCase
  setup do
    @f5_cluster = f5_clusters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:f5_clusters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create f5_cluster" do
    assert_difference('F5Cluster.count') do
      post :create, f5_cluster: { access_ip: @f5_cluster.access_ip, data_center: @f5_cluster.data_center, name: @f5_cluster.name, network_list: @f5_cluster.network_list, network_name_list: @f5_cluster.network_name_list, primary_unit_ip: @f5_cluster.primary_unit_ip, primary_unit_name: @f5_cluster.primary_unit_name, secondary_unit_ip: @f5_cluster.secondary_unit_ip, secondary_unit_name: @f5_cluster.secondary_unit_name }
    end

    assert_redirected_to f5_cluster_path(assigns(:f5_cluster))
  end

  test "should show f5_cluster" do
    get :show, id: @f5_cluster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @f5_cluster
    assert_response :success
  end

  test "should update f5_cluster" do
    put :update, id: @f5_cluster, f5_cluster: { access_ip: @f5_cluster.access_ip, data_center: @f5_cluster.data_center, name: @f5_cluster.name, network_list: @f5_cluster.network_list, network_name_list: @f5_cluster.network_name_list, primary_unit_ip: @f5_cluster.primary_unit_ip, primary_unit_name: @f5_cluster.primary_unit_name, secondary_unit_ip: @f5_cluster.secondary_unit_ip, secondary_unit_name: @f5_cluster.secondary_unit_name }
    assert_redirected_to f5_cluster_path(assigns(:f5_cluster))
  end

  test "should destroy f5_cluster" do
    assert_difference('F5Cluster.count', -1) do
      delete :destroy, id: @f5_cluster
    end

    assert_redirected_to f5_clusters_path
  end
end
