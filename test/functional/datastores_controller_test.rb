require 'test_helper'

class DatastoresControllerTest < ActionController::TestCase
  setup do
    @datastore = datastores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:datastores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create datastore" do
    assert_difference('Datastore.count') do
      post :create, datastore: { accessible: @datastore.accessible, capacity: @datastore.capacity, ds_id: @datastore.ds_id, freespace: @datastore.freespace, name: @datastore.name, url: @datastore.url, vcenter_id: @datastore.vcenter_id, vdc_id: @datastore.vdc_id }
    end

    assert_redirected_to datastore_path(assigns(:datastore))
  end

  test "should show datastore" do
    get :show, id: @datastore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @datastore
    assert_response :success
  end

  test "should update datastore" do
    put :update, id: @datastore, datastore: { accessible: @datastore.accessible, capacity: @datastore.capacity, ds_id: @datastore.ds_id, freespace: @datastore.freespace, name: @datastore.name, url: @datastore.url, vcenter_id: @datastore.vcenter_id, vdc_id: @datastore.vdc_id }
    assert_redirected_to datastore_path(assigns(:datastore))
  end

  test "should destroy datastore" do
    assert_difference('Datastore.count', -1) do
      delete :destroy, id: @datastore
    end

    assert_redirected_to datastores_path
  end
end
