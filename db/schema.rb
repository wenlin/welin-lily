# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091002072706) do

  create_table "memos", :force => true do |t|
    t.string   "name"
    t.string   "note"
    t.integer  "p_first"
    t.integer  "p_last"
    t.integer  "t_first"
    t.integer  "t_last"
    t.integer  "m"
    t.integer  "n"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stuffs", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "day_id"
    t.integer  "sn"
    t.string   "name"
    t.string   "note"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
