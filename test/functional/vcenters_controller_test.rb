require 'test_helper'

class VcentersControllerTest < ActionController::TestCase
  setup do
    @vcenter = vcenters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vcenters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vcenter" do
    assert_difference('Vcenter.count') do
      post :create, vcenter: { description: @vcenter.description, ip: @vcenter.ip, name: @vcenter.name }
    end

    assert_redirected_to vcenter_path(assigns(:vcenter))
  end

  test "should show vcenter" do
    get :show, id: @vcenter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vcenter
    assert_response :success
  end

  test "should update vcenter" do
    put :update, id: @vcenter, vcenter: { description: @vcenter.description, ip: @vcenter.ip, name: @vcenter.name }
    assert_redirected_to vcenter_path(assigns(:vcenter))
  end

  test "should destroy vcenter" do
    assert_difference('Vcenter.count', -1) do
      delete :destroy, id: @vcenter
    end

    assert_redirected_to vcenters_path
  end
end
