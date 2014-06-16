require 'test_helper'

class HhbasControllerTest < ActionController::TestCase
  setup do
    @hhba = hhbas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hhbas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hhba" do
    assert_difference('Hhba.count') do
      post :create, hhba: { driver: @hhba.driver, model: @hhba.model, name: @hhba.name, pci: @hhba.pci, status: @hhba.status, vmhost_id: @hhba.vmhost_id, wwnn: @hhba.wwnn, wwpn: @hhba.wwpn }
    end

    assert_redirected_to hhba_path(assigns(:hhba))
  end

  test "should show hhba" do
    get :show, id: @hhba
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hhba
    assert_response :success
  end

  test "should update hhba" do
    put :update, id: @hhba, hhba: { driver: @hhba.driver, model: @hhba.model, name: @hhba.name, pci: @hhba.pci, status: @hhba.status, vmhost_id: @hhba.vmhost_id, wwnn: @hhba.wwnn, wwpn: @hhba.wwpn }
    assert_redirected_to hhba_path(assigns(:hhba))
  end

  test "should destroy hhba" do
    assert_difference('Hhba.count', -1) do
      delete :destroy, id: @hhba
    end

    assert_redirected_to hhbas_path
  end
end
