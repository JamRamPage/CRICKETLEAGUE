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

ActiveRecord::Schema.define(version: 2019_11_21_125616) do

  create_table "matches", force: :cascade do |t|
    t.date "date", null: false
    t.integer "hometeam_id", null: false
    t.integer "awayteam_id", null: false
    t.string "stadium", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["awayteam_id"], name: "index_matches_on_awayteam_id"
    t.index ["hometeam_id"], name: "index_matches_on_hometeam_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.date "DOB", null: false
    t.integer "team_id", null: false
    t.integer "role", null: false
    t.integer "battinghand", null: false
    t.integer "bowlingstyle", null: false
    t.string "domesticteam"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.integer "won", default: 0, null: false
    t.integer "drawn", default: 0, null: false
    t.integer "lost", default: 0, null: false
    t.integer "noresult", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
