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

ActiveRecord::Schema.define(version: 20170423122615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characteristics", force: :cascade do |t|
    t.text     "options",    default: ["serious", "quirky", "professional", "enterprise", "avant-garde", "esoteric", "boring", "bleeding edge", "another buzzword"],              array: true
    t.datetime "created_at",                                                                                                                                         null: false
    t.datetime "updated_at",                                                                                                                                         null: false
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "score"
    t.integer  "team_member_id"
    t.integer  "project_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["project_id"], name: "index_matches_on_project_id", using: :btree
    t.index ["team_member_id"], name: "index_matches_on_team_member_id", using: :btree
  end

  create_table "member_project_associations", force: :cascade do |t|
    t.integer  "team_member_id"
    t.integer  "project_id"
    t.boolean  "project_manager"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["project_id"], name: "index_member_project_associations_on_project_id", using: :btree
    t.index ["team_member_id"], name: "index_member_project_associations_on_team_member_id", using: :btree
  end

  create_table "project_requirements", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "size"
    t.string   "variety"
    t.string   "length"
    t.string   "client_type"
    t.text     "characteristics", default: [],              array: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["project_id"], name: "index_project_requirements_on_project_id", using: :btree
  end

  create_table "project_teams", force: :cascade do |t|
    t.integer  "project_id"
    t.text     "members",    default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["project_id"], name: "index_project_teams_on_project_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "client"
    t.date     "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.integer  "team_member_id"
    t.integer  "years_experience"
    t.string   "education"
    t.string   "education_type"
    t.string   "skill_category"
    t.text     "skills",           default: [],              array: true
    t.text     "techs",            default: [],              array: true
    t.text     "tech_categories",  default: [],              array: true
    t.text     "characteristics",  default: [],              array: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["team_member_id"], name: "index_skills_on_team_member_id", using: :btree
  end

  create_table "team_members", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.datetime "created_at",                                                                             null: false
    t.datetime "updated_at",                                                                             null: false
    t.string   "photo",      default: "https://robohash.org/culpavoluptateut.png?size=300x300&set=set1"
  end

end
