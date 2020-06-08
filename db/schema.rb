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

ActiveRecord::Schema.define(version: 2020_06_08_194456) do

  create_table "categories", force: :cascade do |t|
    t.boolean "is_play", default: false
    t.boolean "is_hotel", default: false
    t.boolean "is_meal", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string "hotel_name"
    t.string "address"
    t.integer "adult_price", default: 0
    t.integer "cild_price", default: 0
    t.text "impression"
    t.integer "parking", default: 0
    t.string "official_site"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string "shop_name"
    t.string "address"
    t.integer "adult_price", default: 0
    t.integer "cild_price", default: 0
    t.text "impression"
    t.boolean "is_baby_food_place", default: true
    t.integer "parking", default: 0
    t.string "official_site"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plays", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "adult_price", default: 0
    t.integer "cild_price", default: 0
    t.text "impression"
    t.boolean "is_diaper_place", default: true
    t.integer "parking", default: 0
    t.string "official_site"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id"], name: "index_relationships_on_follow_id"
    t.index ["user_id", "follow_id"], name: "index_relationships_on_user_id_and_follow_id", unique: true
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "travels", force: :cascade do |t|
    t.integer "user_id"
    t.integer "play_id"
    t.integer "hotel_id"
    t.integer "meal_id"
    t.integer "travel_image_id"
    t.integer "category_id"
    t.string "title"
    t.date "travel_day"
    t.integer "traffic_way", default: 0
    t.string "recommend_age"
    t.integer "evaluation"
    t.boolean "is_display", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "residence"
    t.text "introduction"
    t.boolean "is_child", default: false, null: false
    t.integer "child_people"
    t.integer "child_age"
    t.boolean "is_diaper", default: false, null: false
    t.boolean "is_baby_food", default: false, null: false
    t.string "user_image_id"
    t.boolean "is_valid", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
