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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160604162120) do

  create_table "educations", force: :cascade do |t|
    t.string   "school_name"
    t.date     "started"
    t.date     "graduated"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "person_id"
  end

  add_index "educations", ["person_id"], name: "index_educations_on_person_id"

  create_table "images", force: :cascade do |t|
    t.string   "file_name"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "person_id"
    t.integer  "project_id"
  end

  add_index "images", ["person_id"], name: "index_images_on_person_id"
  add_index "images", ["project_id"], name: "index_images_on_project_id"

  create_table "people", force: :cascade do |t|
    t.string   "title"
    t.date     "birth_date"
    t.text     "description"
    t.string   "email"
    t.string   "location"
    t.string   "linkedin"
    t.string   "resume_url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "profile_picture_id"
  end

  add_index "people", ["profile_picture_id"], name: "index_people_on_profile_picture_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.date     "started"
    t.date     "ended"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "person_id"
    t.integer  "work_experience_id"
  end

  add_index "projects", ["person_id"], name: "index_projects_on_person_id"
  add_index "projects", ["work_experience_id"], name: "index_projects_on_work_experience_id"

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.decimal  "years",       precision: 18, scale: 2
    t.text     "description"
    t.string   "color"
    t.string   "hover_color"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "person_id"
  end

  add_index "skills", ["person_id"], name: "index_skills_on_person_id"

  create_table "work_experiences", force: :cascade do |t|
    t.string   "company"
    t.string   "title"
    t.string   "url"
    t.date     "started"
    t.date     "ended"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "person_id"
  end

  add_index "work_experiences", ["person_id"], name: "index_work_experiences_on_person_id"

end
