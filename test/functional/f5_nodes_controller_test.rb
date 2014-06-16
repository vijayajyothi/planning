require 'test_helper'

class F5NodesControllerTest < ActionController::TestCase
  setup do
    @f5_node = f5_nodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:f5_nodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create f5_node" do
    assert_difference('F5Node.count') do
      post :create, f5_node: { f5_cluster_id: @f5_node.f5_cluster_id, f5_pool_id: @f5_node.f5_pool_id, ip: @f5_node.ip, port: @f5_node.port, vm_id: @f5_node.vm_id }
    end

    assert_redirected_to f5_node_path(assigns(:f5_node))
  end

  test "should show f5_node" do
    get :show, id: @f5_node
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @f5_node
    assert_response :success
  end

  test "should update f5_node" do
    put :update, id: @f5_node, f5_node: { f5_cluster_id: @f5_node.f5_cluster_id, f5_pool_id: @f5_node.f5_pool_id, ip: @f5_node.ip, port: @f5_node.port, vm_id: @f5_node.vm_id }
    assert_redirected_to f5_node_path(assigns(:f5_node))
  end

  test "should destroy f5_node" do
    assert_difference('F5Node.count', -1) do
      delete :destroy, id: @f5_node
    end

    assert_redirected_to f5_nodes_path
  end
end
