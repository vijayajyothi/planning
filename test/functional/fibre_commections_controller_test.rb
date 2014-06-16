require 'test_helper'

class FibreCommectionsControllerTest < ActionController::TestCase
  setup do
    @fibre_commection = fibre_commections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fibre_commections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fibre_commection" do
    assert_difference('FibreCommection.count') do
      post :create, fibre_commection: { fabric_id: @fibre_commection.fabric_id, fabric_type: @fibre_commection.fabric_type, san_port_id: @fibre_commection.san_port_id, type: @fibre_commection.type }
    end

    assert_redirected_to fibre_commection_path(assigns(:fibre_commection))
  end

  test "should show fibre_commection" do
    get :show, id: @fibre_commection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fibre_commection
    assert_response :success
  end

  test "should update fibre_commection" do
    put :update, id: @fibre_commection, fibre_commection: { fabric_id: @fibre_commection.fabric_id, fabric_type: @fibre_commection.fabric_type, san_port_id: @fibre_commection.san_port_id, type: @fibre_commection.type }
    assert_redirected_to fibre_commection_path(assigns(:fibre_commection))
  end

  test "should destroy fibre_commection" do
    assert_difference('FibreCommection.count', -1) do
      delete :destroy, id: @fibre_commection
    end

    assert_redirected_to fibre_commections_path
  end
end
