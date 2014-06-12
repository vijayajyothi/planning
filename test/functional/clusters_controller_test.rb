require 'test_helper'

class ClustersControllerTest < ActionController::TestCase
  setup do
    @cluster = clusters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clusters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cluster" do
    assert_difference('Cluster.count') do
      post :create, cluster: { cpu_no_cores: @cluster.cpu_no_cores, cpu_total_mhz: @cluster.cpu_total_mhz, mem_total_mb: @cluster.mem_total_mb, name: @cluster.name, vcenter_id: @cluster.vcenter_id, vdc_id: @cluster.vdc_id }
    end

    assert_redirected_to cluster_path(assigns(:cluster))
  end

  test "should show cluster" do
    get :show, id: @cluster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cluster
    assert_response :success
  end

  test "should update cluster" do
    put :update, id: @cluster, cluster: { cpu_no_cores: @cluster.cpu_no_cores, cpu_total_mhz: @cluster.cpu_total_mhz, mem_total_mb: @cluster.mem_total_mb, name: @cluster.name, vcenter_id: @cluster.vcenter_id, vdc_id: @cluster.vdc_id }
    assert_redirected_to cluster_path(assigns(:cluster))
  end

  test "should destroy cluster" do
    assert_difference('Cluster.count', -1) do
      delete :destroy, id: @cluster
    end

    assert_redirected_to clusters_path
  end
end
