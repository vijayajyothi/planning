require 'test_helper'

class VimEventsControllerTest < ActionController::TestCase
  setup do
    @vim_event = vim_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vim_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vim_event" do
    assert_difference('VimEvent.count') do
      post :create, vim_event: { event_message: @vim_event.event_message, event_tag: @vim_event.event_tag, event_type: @vim_event.event_type, time_stamp: @vim_event.time_stamp, username: @vim_event.username, vcenter_id: @vim_event.vcenter_id, vdc_id: @vim_event.vdc_id, vm_id: @vim_event.vm_id, vmhost_id: @vim_event.vmhost_id }
    end

    assert_redirected_to vim_event_path(assigns(:vim_event))
  end

  test "should show vim_event" do
    get :show, id: @vim_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vim_event
    assert_response :success
  end

  test "should update vim_event" do
    put :update, id: @vim_event, vim_event: { event_message: @vim_event.event_message, event_tag: @vim_event.event_tag, event_type: @vim_event.event_type, time_stamp: @vim_event.time_stamp, username: @vim_event.username, vcenter_id: @vim_event.vcenter_id, vdc_id: @vim_event.vdc_id, vm_id: @vim_event.vm_id, vmhost_id: @vim_event.vmhost_id }
    assert_redirected_to vim_event_path(assigns(:vim_event))
  end

  test "should destroy vim_event" do
    assert_difference('VimEvent.count', -1) do
      delete :destroy, id: @vim_event
    end

    assert_redirected_to vim_events_path
  end
end
