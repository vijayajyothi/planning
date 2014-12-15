# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141215050508) do

  create_table "applications", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "notes"
    t.string   "business_owner"
    t.string   "ops_status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "appresources", :force => true do |t|
    t.integer  "application_id"
    t.integer  "service_id"
    t.string   "ops_status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "clusters", :force => true do |t|
    t.string   "name"
    t.integer  "vdc_id"
    t.integer  "ha_enabled"
    t.integer  "drs_enables"
    t.integer  "folder_id"
    t.integer  "cpu_total_mhz"
    t.integer  "mem_total_mb"
    t.integer  "cpu_no_cores"
    t.integer  "vcenter_id"
    t.string   "ops_status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "datastores", :force => true do |t|
    t.string   "name"
    t.string   "ds_id"
    t.string   "accessible"
    t.string   "url"
    t.integer  "capacity"
    t.integer  "freespace"
    t.integer  "vcenter_id"
    t.integer  "vdc_id"
    t.string   "ops_status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dns_records", :force => true do |t|
    t.string   "ip"
    t.string   "fqdn"
    t.string   "record_type"
    t.integer  "vm_id"
    t.integer  "f5_vip_id"
    t.integer  "f5_node_id"
    t.string   "ops_status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "f5_clusters", :force => true do |t|
    t.string   "data_center"
    t.string   "primary_unit_ip"
    t.string   "secondary_unit_ip"
    t.string   "primary_unit_name"
    t.string   "secondary_unit_name"
    t.string   "network_list"
    t.string   "network_name_list"
    t.string   "access_ip"
    t.string   "name"
    t.string   "ops_status"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "active"
  end

  create_table "f5_devices", :force => true do |t|
    t.string   "name"
    t.string   "ip"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "ops_status"
  end

  create_table "f5_nodes", :force => true do |t|
    t.string   "ip"
    t.integer  "port"
    t.integer  "f5_pool_id"
    t.integer  "f5_cluster_id"
    t.integer  "vm_id"
    t.string   "ops_status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "f5_vip_id"
    t.string   "node_enable"
    t.string   "node_status"
  end

  create_table "f5_pools", :force => true do |t|
    t.string   "name"
    t.integer  "f5_vip_id"
    t.integer  "f5_cluster_id"
    t.string   "lb_method"
    t.string   "ops_status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "pool_status"
  end

  create_table "f5_vips", :force => true do |t|
    t.string   "name"
    t.string   "ip"
    t.integer  "port"
    t.integer  "application_id"
    t.integer  "instance_id"
    t.integer  "tier_id"
    t.integer  "f5_cluster_id"
    t.string   "ops_status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "vip_enable"
    t.string   "vip_status"
  end

  create_table "fibre_commections", :force => true do |t|
    t.string   "type"
    t.integer  "fabric_id"
    t.string   "fabric_type"
    t.integer  "san_port_id"
    t.string   "ops_status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "field_labels", :force => true do |t|
    t.string   "o_type"
    t.string   "field_name"
    t.string   "label"
    t.boolean  "display"
    t.string   "display_page"
    t.boolean  "sub_panel"
    t.string   "external_resource"
    t.string   "external_variable"
    t.boolean  "external_resource_display"
    t.string   "style_name"
    t.boolean  "table_display"
    t.boolean  "child_table_display"
    t.boolean  "main_field"
    t.string   "ops_status"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "folders", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.string   "description"
    t.string   "ops_status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "hhbas", :force => true do |t|
    t.string   "name"
    t.integer  "vmhost_id"
    t.string   "status"
    t.string   "model"
    t.string   "driver"
    t.string   "pci"
    t.string   "wwnn"
    t.string   "wwpn"
    t.string   "ops_status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "host_luns", :force => true do |t|
    t.integer  "lun_no"
    t.integer  "vmhost_id"
    t.integer  "storage_lun_id"
    t.integer  "storage_array_id"
    t.integer  "storage_group_id"
    t.integer  "hhba_id"
    t.string   "ops_status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "hw_devices", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "manufacturer"
    t.string   "model"
    t.string   "serial_no"
    t.string   "asset_no"
    t.string   "status"
    t.string   "country"
    t.string   "state"
    t.string   "building"
    t.string   "room"
    t.string   "floor"
    t.integer  "ru_size"
    t.integer  "ru_position"
    t.string   "hostname"
    t.string   "ip"
    t.string   "owned_by"
    t.string   "assigned_by"
    t.string   "cost_center"
    t.string   "console"
    t.string   "console_ip"
    t.string   "ops_status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "instances", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "application_id"
    t.integer  "inst_id"
    t.string   "ops_status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "lun_disks", :force => true do |t|
    t.string   "storage_lun_id"
    t.string   "physical_disk_id"
    t.string   "ops_status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "network_ports", :force => true do |t|
    t.string   "name"
    t.integer  "network_switch_id"
    t.string   "object_id"
    t.string   "type"
    t.string   "alias"
    t.integer  "speed_in"
    t.integer  "speed_out"
    t.integer  "ip"
    t.string   "if_alias"
    t.string   "if_name"
    t.string   "if_index"
    t.string   "contact"
    t.string   "full_duplex"
    t.string   "unique_id"
    t.string   "if_macaddress"
    t.string   "ops_status"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "network_switches", :force => true do |t|
    t.string   "name"
    t.string   "unique_id"
    t.string   "contact"
    t.string   "description"
    t.string   "location"
    t.string   "ip"
    t.string   "vendor"
    t.string   "model"
    t.string   "version"
    t.string   "device_type"
    t.string   "serial_no"
    t.string   "ops_status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "new_vms", :force => true do |t|
    t.string   "name"
    t.string   "resource_pool"
    t.string   "status"
    t.datetime "last_boot"
    t.string   "vm_hostname"
    t.string   "ip"
    t.integer  "vmhost_id"
    t.integer  "tier_id"
    t.string   "backup"
    t.string   "hw_version"
    t.integer  "total_mem_mb"
    t.integer  "num_cpus"
    t.integer  "num_vnics"
    t.string   "power_state"
    t.string   "connection_state"
    t.string   "os"
    t.string   "uuid"
    t.string   "tools_version"
    t.string   "tools_status"
    t.datetime "created_time"
    t.string   "created_by"
    t.integer  "folder_id"
    t.string   "hz_numer"
    t.integer  "application_id"
    t.integer  "vcenter_id"
    t.integer  "vdc_id"
    t.integer  "cluster_id"
    t.integer  "instance_id"
    t.string   "persistent_id"
    t.string   "vm_id"
    t.string   "version"
    t.datetime "last_suspend"
    t.integer  "last_suspend_interval"
    t.datetime "last_change"
    t.string   "owner"
    t.string   "ppm_no"
    t.boolean  "is_cloud"
    t.string   "ops_status"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "physical_disks", :force => true do |t|
    t.string   "name"
    t.integer  "storage_array_id"
    t.integer  "storage_dae_id"
    t.string   "disk_type"
    t.string   "vendor"
    t.string   "speed"
    t.string   "product_id"
    t.string   "revision"
    t.string   "serial_no"
    t.integer  "capacity_mb"
    t.integer  "user_capacity_mb"
    t.string   "ops_status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "pnics", :force => true do |t|
    t.string   "name"
    t.integer  "vmhost_id"
    t.integer  "speed"
    t.string   "macaddress"
    t.string   "network_switch_id"
    t.string   "network_port_id"
    t.string   "vlan"
    t.string   "observed"
    t.integer  "vswitch_id"
    t.string   "ops_status"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "portgroups", :force => true do |t|
    t.string   "name"
    t.integer  "vmhost_id"
    t.string   "vswitch"
    t.integer  "pnic_id"
    t.string   "a_s"
    t.integer  "vswitch_id"
    t.integer  "vcenter_id"
    t.integer  "vdc_id"
    t.string   "ops_status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "san_ports", :force => true do |t|
    t.integer  "san_switch_id"
    t.integer  "index"
    t.integer  "slot"
    t.integer  "port"
    t.string   "speed"
    t.string   "status"
    t.string   "protocol"
    t.string   "port_type"
    t.string   "ops_status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "san_switches", :force => true do |t|
    t.string   "name"
    t.string   "ip"
    t.string   "vendor"
    t.string   "model"
    t.string   "boot_prom"
    t.string   "fabric_os"
    t.string   "factory_part_no"
    t.string   "kernel"
    t.string   "part_no"
    t.string   "serial_no"
    t.string   "domain"
    t.string   "switch_id"
    t.string   "state"
    t.string   "switch_type"
    t.string   "wwn"
    t.string   "ops_status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "search_types", :force => true do |t|
    t.string   "asset_type"
    t.string   "asset_label"
    t.string   "main_field"
    t.string   "ops_status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "priority"
    t.string   "notes"
    t.string   "category"
    t.string   "ops_status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "storage_arrays", :force => true do |t|
    t.string   "name"
    t.string   "ip"
    t.string   "uid"
    t.string   "model"
    t.string   "model_type"
    t.string   "agent_revision"
    t.string   "prom_revision"
    t.string   "revision"
    t.string   "serial_no"
    t.string   "cabinet"
    t.string   "ops_status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "storage_daes", :force => true do |t|
    t.string   "name"
    t.integer  "storage_array_id"
    t.string   "assembly_name"
    t.string   "vendor_part_no"
    t.string   "assy_revision"
    t.string   "art_revision"
    t.string   "serial_no"
    t.string   "manufacture_date"
    t.string   "ops_status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "storage_group_luns", :force => true do |t|
    t.integer  "storage_group_id"
    t.integer  "storage_lun_id"
    t.integer  "host_lun"
    t.string   "ops_status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "storage_groups", :force => true do |t|
    t.string   "name"
    t.integer  "storage_array_id"
    t.integer  "hhba_id"
    t.integer  "vmhost_id"
    t.string   "ops_status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "storage_luns", :force => true do |t|
    t.string   "lun"
    t.integer  "storage_array_id"
    t.string   "lun_name"
    t.string   "device_type"
    t.integer  "capacity_mb"
    t.string   "raid_type"
    t.integer  "lun_no"
    t.string   "ops_status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "storage_processors", :force => true do |t|
    t.string   "name"
    t.integer  "storage_array_id"
    t.string   "assembly_name"
    t.string   "vendor_part_no"
    t.string   "assy_revision"
    t.string   "art_revision"
    t.string   "serial_no"
    t.string   "cabinet"
    t.integer  "mem_size_kb"
    t.integer  "manufacture_year"
    t.string   "manufacture_date"
    t.string   "ops_status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "tiers", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "application_id"
    t.integer  "instance_id"
    t.string   "ops_status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "vcenters", :force => true do |t|
    t.string   "name"
    t.string   "ip"
    t.string   "description"
    t.string   "ops_status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "location"
    t.date     "new_born_on"
    t.string   "ip_address"
  end

  create_table "vdcs", :force => true do |t|
    t.string   "name"
    t.integer  "folder_id"
    t.string   "description"
    t.integer  "vcenter_id"
    t.string   "ops_status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "vdisks", :force => true do |t|
    t.string   "name"
    t.integer  "vm_id"
    t.integer  "vcenter_id"
    t.string   "type"
    t.string   "persistence"
    t.string   "format"
    t.integer  "datastore_id"
    t.string   "filename"
    t.integer  "capacitykb"
    t.string   "ops_status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "vim_events", :force => true do |t|
    t.datetime "time_stamp"
    t.string   "username"
    t.string   "event_message"
    t.string   "event_type"
    t.string   "event_tag"
    t.integer  "vcenter_id"
    t.integer  "vmhost_id"
    t.integer  "vm_id"
    t.integer  "vdc_id"
    t.string   "ops_status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "vmhosts", :force => true do |t|
    t.string   "name"
    t.string   "ip"
    t.integer  "cluster_id"
    t.integer  "parent_id"
    t.string   "connection_state"
    t.string   "power_state"
    t.integer  "cpu_total_mhz"
    t.integer  "mem_total_mb"
    t.string   "esx_product"
    t.string   "esx_version"
    t.string   "esx_build"
    t.string   "esx_api_version"
    t.string   "host_id"
    t.string   "is_standalone"
    t.integer  "hw_device_id"
    t.integer  "vcenter_id"
    t.string   "uuid"
    t.string   "vendor"
    t.string   "model"
    t.string   "cpu_model"
    t.integer  "num_cpu"
    t.integer  "num_core"
    t.string   "serial_no"
    t.string   "bios_version"
    t.string   "ops_status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "vms", :force => true do |t|
    t.string   "name"
    t.string   "resource_pool"
    t.string   "status"
    t.datetime "last_boot"
    t.string   "vm_hostname"
    t.string   "ip"
    t.integer  "vmhost_id"
    t.integer  "tier_id"
    t.string   "backup"
    t.string   "hw_version"
    t.integer  "total_mem_mb"
    t.integer  "num_cpus"
    t.integer  "num_vnics"
    t.string   "power_state"
    t.string   "connection_state"
    t.string   "os"
    t.string   "uuid"
    t.string   "tools_version"
    t.string   "tools_status"
    t.datetime "created_time"
    t.string   "created_by"
    t.integer  "folder_id"
    t.string   "hz_numer"
    t.integer  "application_id"
    t.integer  "vcenter_id"
    t.integer  "vdc_id"
    t.integer  "cluster_id"
    t.integer  "instance_id"
    t.string   "persistent_id"
    t.string   "vm_id"
    t.string   "version"
    t.datetime "last_suspend"
    t.integer  "last_suspend_interval"
    t.datetime "last_change"
    t.string   "owner"
    t.string   "ppm_no"
    t.boolean  "is_cloud"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "ops_status"
    t.date     "new_born_on"
    t.string   "guest_state"
    t.string   "provisioned_space"
    t.string   "used_space"
  end

  create_table "vmvips", :force => true do |t|
    t.integer  "vm_id"
    t.integer  "f5_vip_id"
    t.string   "ops_status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vnics", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "vm_id"
    t.integer  "vcenter_id"
    t.string   "connect_state"
    t.string   "macaddress"
    t.integer  "portgroup_id"
    t.string   "ops_status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "vswitches", :force => true do |t|
    t.string   "name"
    t.integer  "vcenter_id"
    t.integer  "vdc_id"
    t.integer  "vmhost_id"
    t.string   "ops_status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
