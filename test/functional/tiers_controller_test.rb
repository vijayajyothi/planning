require 'test_helper'

class TiersControllerTest < ActionController::TestCase
  setup do
    @tier = tiers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tiers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tier" do
    assert_difference('Tier.count') do
      post :create, tier: { application_id: @tier.application_id, description: @tier.description, instance_id: @tier.instance_id, name: @tier.name }
    end

    assert_redirected_to tier_path(assigns(:tier))
  end

  test "should show tier" do
    get :show, id: @tier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tier
    assert_response :success
  end

  test "should update tier" do
    put :update, id: @tier, tier: { application_id: @tier.application_id, description: @tier.description, instance_id: @tier.instance_id, name: @tier.name }
    assert_redirected_to tier_path(assigns(:tier))
  end

  test "should destroy tier" do
    assert_difference('Tier.count', -1) do
      delete :destroy, id: @tier
    end

    assert_redirected_to tiers_path
  end
end
