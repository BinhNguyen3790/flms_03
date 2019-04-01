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

ActiveRecord::Schema.define(version: 0) do

  create_table "authors", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.string "profile", null: false
    t.string "avatar", null: false
  end

  create_table "books", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "publisher_id", null: false
    t.integer "author_id", null: false
    t.string "name", null: false
    t.string "author", null: false
    t.string "category", null: false
    t.string "content", null: false
    t.string "year", null: false
    t.string "publisher", null: false
    t.integer "number_of_pages", null: false
    t.integer "quantity", null: false
    t.index ["author_id"], name: "author_id"
    t.index ["category_id"], name: "category_id"
    t.index ["publisher_id"], name: "publisher_id"
  end

  create_table "categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "comments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.string "content", null: false
    t.index ["book_id"], name: "id_book"
    t.index ["user_id"], name: "user_id"
  end

  create_table "follows", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci", force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "user_id", null: false
    t.index ["author_id"], name: "author_id"
    t.index ["user_id"], name: "user_id"
  end

  create_table "likes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.index ["book_id"], name: "book_id"
    t.index ["user_id"], name: "user_id"
  end

  create_table "publishers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "ratings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.integer "rate", limit: 1, default: 0, null: false
    t.integer "content", null: false
    t.index ["book_id"], name: "book_id"
    t.index ["user_id"], name: "user_id"
  end

  create_table "relationships", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci", force: :cascade do |t|
    t.integer "folower_id", null: false
    t.integer "followed_id", null: false
  end

  create_table "request_details", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "request_id", null: false
    t.integer "quantity", null: false
    t.string "status", limit: 1, null: false
    t.index ["book_id"], name: "book_id"
    t.index ["request_id"], name: "request_id"
  end

  create_table "requests", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "status", limit: 1, null: false
    t.date "from_date", null: false
    t.date "to_date", null: false
    t.index ["user_id"], name: "user_id"
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.string "phone", null: false
    t.string "adress", null: false
    t.integer "role", limit: 1, default: 0
  end

  add_foreign_key "books", "authors", name: "books_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "books", "categories", name: "books_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "books", "publishers", name: "books_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "comments", "books", name: "comments_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "comments", "users", name: "comments_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "follows", "authors", name: "follows_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "follows", "users", name: "follows_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "likes", "books", name: "likes_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "likes", "users", name: "likes_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ratings", "books", name: "ratings_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ratings", "users", name: "ratings_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "relationships", "users", column: "id", name: "relationships_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "request_details", "books", name: "request_details_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "request_details", "requests", name: "request_details_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "requests", "users", name: "requests_ibfk_1", on_update: :cascade, on_delete: :cascade
end
