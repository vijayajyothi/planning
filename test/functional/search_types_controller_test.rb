require 'test_helper'

class SearchTypesControllerTest < ActionController::TestCase
  setup do
    @search_type = search_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:search_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search_type" do
    assert_difference('SearchType.count') do
      post :create, search_type: { asset_label: @search_type.asset_label, asset_type: @search_type.asset_type, main_field: @search_type.main_field }
    end

    assert_redirected_to search_type_path(assigns(:search_type))
  end

  test "should show search_type" do
    get :show, id: @search_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @search_type
    assert_response :success
  end

  test "should update search_type" do
    put :update, id: @search_type, search_type: { asset_label: @search_type.asset_label, asset_type: @search_type.asset_type, main_field: @search_type.main_field }
    assert_redirected_to search_type_path(assigns(:search_type))
  end

  test "should destroy search_type" do
    assert_difference('SearchType.count', -1) do
      delete :destroy, id: @search_type
    end

    assert_redirected_to search_types_path
  end
end
