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

ActiveRecord::Schema.define(version: 2019_03_21_100125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "c_username"
    t.string "c_phone"
    t.string "c_email"
    t.string "c_education"
    t.string "c_skills"
    t.string "c_country"
    t.string "c_region"
    t.string "c_city"
    t.string "c_age"
    t.string "c_gender"
    t.string "c_video_url"
    t.integer "price"
    t.integer "category_id"
    t.integer "user_id"
    t.string "image1"
    t.string "image2"
    t.string "image3"
    t.string "image4"
    t.string "image5"
    t.string "image6"
    t.string "image7"
    t.string "image8"
    t.string "image9"
    t.string "image10"
    t.integer "subcategory_id"
    t.integer "subsubcategory_id"
    t.index ["category_id"], name: "index_courses_on_category_id"
    t.index ["subcategory_id"], name: "index_courses_on_subcategory_id"
    t.index ["subsubcategory_id"], name: "index_courses_on_subsubcategory_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "category_id"
  end

  create_table "subsubcategories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subcategory_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phonenumber"
    t.string "username"
    t.string "education"
    t.string "video_url"
    t.integer "age"
    t.text "body"
    t.string "avatar"
    t.string "image1"
    t.string "image2"
    t.string "image3"
    t.string "image4"
    t.string "image5"
    t.string "image6"
    t.string "image7"
    t.string "image8"
    t.string "image9"
    t.string "image10"
    t.index ["phonenumber"], name: "index_users_on_phonenumber", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
