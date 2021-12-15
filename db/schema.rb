# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_13_035707) do

  create_table "anime_news", force: :cascade do |t|
    t.string "headline"
    t.string "context"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "animes", force: :cascade do |t|
    t.string "name"
    t.text "synosis"
    t.integer "day_in_week"
    t.time "show_time"
    t.boolean "on_air"
    t.integer "episode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comment_animes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "anime_id", null: false
    t.string "msg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anime_id"], name: "index_comment_animes_on_anime_id"
    t.index ["user_id"], name: "index_comment_animes_on_user_id"
  end

  create_table "comment_news", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "anime_news_id", null: false
    t.string "msg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anime_news_id"], name: "index_comment_news_on_anime_news_id"
    t.index ["user_id"], name: "index_comment_news_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "anime_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anime_id"], name: "index_follows_on_anime_id"
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "like_animes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "anime_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anime_id"], name: "index_like_animes_on_anime_id"
    t.index ["user_id"], name: "index_like_animes_on_user_id"
  end

  create_table "like_news", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "anime_news_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anime_news_id"], name: "index_like_news_on_anime_news_id"
    t.index ["user_id"], name: "index_like_news_on_user_id"
  end

  create_table "my_lists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "anime_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anime_id"], name: "index_my_lists_on_anime_id"
    t.index ["user_id"], name: "index_my_lists_on_user_id"
  end

  create_table "news", force: :cascade do |t|
    t.string "headline"
    t.string "context"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "platform1s", force: :cascade do |t|
    t.string "name"
    t.text "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "platforms", force: :cascade do |t|
    t.integer "anime_id", null: false
    t.string "name"
    t.text "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anime_id"], name: "index_platforms_on_anime_id"
  end

  create_table "source0s", force: :cascade do |t|
    t.integer "anime_id", null: false
    t.integer "platform1_id", null: false
    t.text "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anime_id"], name: "index_source0s_on_anime_id"
    t.index ["platform1_id"], name: "index_source0s_on_platform1_id"
  end

  create_table "source1s", force: :cascade do |t|
    t.integer "anime_id", null: false
    t.integer "platform_id", null: false
    t.text "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anime_id"], name: "index_source1s_on_anime_id"
    t.index ["platform_id"], name: "index_source1s_on_platform_id"
  end

  create_table "sources", force: :cascade do |t|
    t.integer "anime_id", null: false
    t.string "name"
    t.string "type"
    t.text "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anime_id"], name: "index_sources_on_anime_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comment_animes", "animes"
  add_foreign_key "comment_animes", "users"
  add_foreign_key "comment_news", "anime_news"
  add_foreign_key "comment_news", "users"
  add_foreign_key "follows", "animes"
  add_foreign_key "follows", "users"
  add_foreign_key "like_animes", "animes"
  add_foreign_key "like_animes", "users"
  add_foreign_key "like_news", "anime_news"
  add_foreign_key "like_news", "users"
  add_foreign_key "my_lists", "animes"
  add_foreign_key "my_lists", "users"
  add_foreign_key "platforms", "animes"
  add_foreign_key "source0s", "animes"
  add_foreign_key "source0s", "platform1s"
  add_foreign_key "source1s", "animes"
  add_foreign_key "source1s", "platforms"
  add_foreign_key "sources", "animes"
end
