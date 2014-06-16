require 'test_helper'

class AppresourcesControllerTest < ActionController::TestCase
  setup do
    @appresource = appresources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appresources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appresource" do
    assert_difference('Appresource.count') do
      post :create, appresource: { application_id: @appresource.application_id, service_id: @appresource.service_id }
    end

    assert_redirected_to appresource_path(assigns(:appresource))
  end

  test "should show appresource" do
    get :show, id: @appresource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appresource
    assert_response :success
  end

  test "should update appresource" do
    put :update, id: @appresource, appresource: { application_id: @appresource.application_id, service_id: @appresource.service_id }
    assert_redirected_to appresource_path(assigns(:appresource))
  end

  test "should destroy appresource" do
    assert_difference('Appresource.count', -1) do
      delete :destroy, id: @appresource
    end

    assert_redirected_to appresources_path
  end
end
