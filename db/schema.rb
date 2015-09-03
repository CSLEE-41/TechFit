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

ActiveRecord::Schema.define(version: 20150902234323) do

  create_table "events", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "goal_lists", force: :cascade do |t|
    t.string   "title"
    t.integer  "current_weight"
    t.integer  "goal_weight"
    t.text     "goal_one"
    t.text     "goal_two"
    t.text     "goal_three"
    t.text     "goal_four"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "goal_lists", ["user_id"], name: "index_goal_lists_on_user_id"

  create_table "goals", force: :cascade do |t|
    t.text     "goal"
    t.boolean  "complete"
    t.integer  "user_id"
    t.integer  "goal_list_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "goals", ["goal_list_id"], name: "index_goals_on_goal_list_id"
  add_index "goals", ["user_id"], name: "index_goals_on_user_id"

  create_table "nutrition_plans", force: :cascade do |t|
    t.string   "title"
    t.date     "day"
    t.text     "meal_plan"
    t.text     "notes"
    t.integer  "day_total_calories"
    t.integer  "day_total_carbs"
    t.integer  "day_total_protein"
    t.integer  "day_total_fats"
    t.integer  "calories_goal"
    t.integer  "carbs_goal"
    t.integer  "protein_goal"
    t.integer  "fats_goal"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "nutrition_plans", ["user_id"], name: "index_nutrition_plans_on_user_id"

  create_table "photos", force: :cascade do |t|
    t.string   "photo_img"
    t.string   "title"
    t.date     "day"
    t.text     "message"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "photos", ["user_id"], name: "index_photos_on_user_id"

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.string   "category"
    t.text     "ingredients"
    t.text     "instructions"
    t.string   "food_pic"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id"

  create_table "trackers", force: :cascade do |t|
    t.boolean  "nutrition"
    t.boolean  "workout"
    t.boolean  "goals"
    t.boolean  "weight"
    t.boolean  "health"
    t.date     "day"
    t.integer  "day_points"
    t.integer  "overall_points"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "trackers", ["user_id"], name: "index_trackers_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "workouts", force: :cascade do |t|
    t.string   "title"
    t.string   "muscle_group"
    t.text     "body"
    t.date     "day"
    t.text     "notes"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "workouts", ["user_id"], name: "index_workouts_on_user_id"

end
