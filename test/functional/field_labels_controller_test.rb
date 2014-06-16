require 'test_helper'

class FieldLabelsControllerTest < ActionController::TestCase
  setup do
    @field_label = field_labels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:field_labels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create field_label" do
    assert_difference('FieldLabel.count') do
      post :create, field_label: { child_table_display: @field_label.child_table_display, display: @field_label.display, display_page: @field_label.display_page, external_resource: @field_label.external_resource, external_resource_display: @field_label.external_resource_display, external_variable: @field_label.external_variable, field_name: @field_label.field_name, label: @field_label.label, main_field: @field_label.main_field, o_type: @field_label.o_type, style_name: @field_label.style_name, sub_panel: @field_label.sub_panel, table_display: @field_label.table_display }
    end

    assert_redirected_to field_label_path(assigns(:field_label))
  end

  test "should show field_label" do
    get :show, id: @field_label
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @field_label
    assert_response :success
  end

  test "should update field_label" do
    put :update, id: @field_label, field_label: { child_table_display: @field_label.child_table_display, display: @field_label.display, display_page: @field_label.display_page, external_resource: @field_label.external_resource, external_resource_display: @field_label.external_resource_display, external_variable: @field_label.external_variable, field_name: @field_label.field_name, label: @field_label.label, main_field: @field_label.main_field, o_type: @field_label.o_type, style_name: @field_label.style_name, sub_panel: @field_label.sub_panel, table_display: @field_label.table_display }
    assert_redirected_to field_label_path(assigns(:field_label))
  end

  test "should destroy field_label" do
    assert_difference('FieldLabel.count', -1) do
      delete :destroy, id: @field_label
    end

    assert_redirected_to field_labels_path
  end
end
