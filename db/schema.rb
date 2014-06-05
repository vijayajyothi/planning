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

ActiveRecord::Schema.define(:version => 20140605073426) do

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "vms", :force => true do |t|
    t.string   "datacenter"
    t.string   "qtynics"
    t.string   "createdby"
    t.datetime "createdtime"
    t.string   "suspendinterval"
    t.datetime "suspendtime"
    t.string   "boottime"
    t.string   "storageuncommitted"
    t.string   "storagecommitted"
    t.string   "ipaddress"
    t.string   "hostname"
    t.string   "toolsrunningstatus"
    t.string   "toolsversion"
    t.string   "toolstatus"
    t.string   "guestfullname"
    t.string   "usedspacegb"
    t.string   "provisionedspacegb"
    t.string   "memorymb"
    t.string   "numcpu"
    t.string   "version"
    t.string   "gueststate"
    t.string   "connectionstate"
    t.string   "powerstate"
    t.string   "application"
    t.string   "persistentid"
    t.string   "vmname"
    t.string   "vmhost"
    t.string   "folder"
    t.string   "reourcepool"
    t.string   "cluster"
    t.string   "vcserver"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "ops_status"
  end

end
