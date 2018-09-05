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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_03_185843) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "applicants", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.text "address"
    t.string "city"
    t.text "state"
    t.integer "zip"
    t.integer "age"
    t.string "education"
    t.string "course_id"
    t.string "cohort_id"
    t.string "aid"
    t.text "about"
    t.boolean "agree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aid"], name: "index_applicants_on_aid", unique: true
    t.index ["email"], name: "index_applicants_on_email", unique: true
  end

  create_table "cohorts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.integer "course_id"
    t.string "instructor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "hours"
    t.string "reward"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.integer "age"
    t.integer "salary"
    t.string "education"
    t.text "bio"
    t.string "sid"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_instructors_on_email", unique: true
    t.index ["sid"], name: "index_instructors_on_sid", unique: true
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.text "about"
    t.boolean "agree"
    t.integer "age"
    t.string "education"
    t.integer "cohort_id"
    t.integer "course_id"
    t.string "sid"
    t.boolean "reviewed", default: false
    t.boolean "accepted", default: false
    t.text "rewards"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sid"], name: "index_students_on_sid", unique: true
  end

end
