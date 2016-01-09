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

ActiveRecord::Schema.define(version: 20160105080646) do

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "groups_tags", id: false, force: :cascade do |t|
    t.integer "group_id"
    t.integer "tag_id"
  end

  add_index "groups_tags", ["group_id"], name: "index_groups_tags_on_group_id"
  add_index "groups_tags", ["tag_id"], name: "index_groups_tags_on_tag_id"

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "posts_tags", id: false, force: :cascade do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  add_index "posts_tags", ["post_id"], name: "index_posts_tags_on_post_id"
  add_index "posts_tags", ["tag_id"], name: "index_posts_tags_on_tag_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "subscriptions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "tag_id"
  end

  create_table "taggroups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggroups_users", id: false, force: :cascade do |t|
    t.integer "taggroup_id"
    t.integer "user_id"
  end

  add_index "taggroups_users", ["taggroup_id"], name: "index_taggroups_users_on_taggroup_id"
  add_index "taggroups_users", ["user_id"], name: "index_taggroups_users_on_user_id"

  create_table "tags", force: :cascade do |t|
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "tags_taggroups", id: false, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "taggroup_id"
  end

  add_index "tags_taggroups", ["tag_id"], name: "index_tags_taggroups_on_tag_id"
  add_index "tags_taggroups", ["taggroup_id"], name: "index_tags_taggroups_on_taggroup_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "password_digest"
  end

end
