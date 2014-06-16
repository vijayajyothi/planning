require 'test_helper'

class DnsRecordsControllerTest < ActionController::TestCase
  setup do
    @dns_record = dns_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dns_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dns_record" do
    assert_difference('DnsRecord.count') do
      post :create, dns_record: { f5_node_id: @dns_record.f5_node_id, f5_vip_id: @dns_record.f5_vip_id, fqdn: @dns_record.fqdn, ip: @dns_record.ip, record_type: @dns_record.record_type, vm_id: @dns_record.vm_id }
    end

    assert_redirected_to dns_record_path(assigns(:dns_record))
  end

  test "should show dns_record" do
    get :show, id: @dns_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dns_record
    assert_response :success
  end

  test "should update dns_record" do
    put :update, id: @dns_record, dns_record: { f5_node_id: @dns_record.f5_node_id, f5_vip_id: @dns_record.f5_vip_id, fqdn: @dns_record.fqdn, ip: @dns_record.ip, record_type: @dns_record.record_type, vm_id: @dns_record.vm_id }
    assert_redirected_to dns_record_path(assigns(:dns_record))
  end

  test "should destroy dns_record" do
    assert_difference('DnsRecord.count', -1) do
      delete :destroy, id: @dns_record
    end

    assert_redirected_to dns_records_path
  end
end
