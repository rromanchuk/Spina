class CreateSpinaTables < ActiveRecord::Migration[4.2]
  def change
    enable_extension "uuid-ossp"
    create_table "spina_accounts", id: :uuid, force: :cascade do |t|
      t.string "name"
      t.string "address"
      t.string "postal_code"
      t.string "city"
      t.string "phone"
      t.string "email"
      t.text "preferences"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.boolean "robots_allowed", default: false
    end

    create_table "spina_attachment_collections", id: :uuid, force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "spina_attachment_collections_attachments", id: :uuid, force: :cascade do |t|
      t.uuid "attachment_collection_id"
      t.uuid "attachment_id"
    end

    create_table "spina_attachments", id: :uuid, force: :cascade do |t|
      t.string "file"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "spina_layout_parts", id: :uuid, force: :cascade do |t|
      t.string "title"
      t.string "name"
      t.uuid "layout_partable_id"
      t.string "layout_partable_type"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.uuid "account_id"
    end

    create_table "spina_lines", id: :uuid, force: :cascade do |t|
      t.string "content"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "spina_page_parts", id: :uuid, force: :cascade do |t|
      t.string "title"
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.uuid "page_id"
      t.uuid "page_partable_id"
      t.string "page_partable_type"
    end

    create_table "spina_pages", id: :uuid, force: :cascade do |t|
      t.string "title"
      t.string "menu_title"
      t.string "description"
      t.boolean "show_in_menu", default: true
      t.string "slug"
      t.boolean "deletable", default: true
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "name"
      t.string "seo_title"
      t.boolean "skip_to_first_child", default: false
      t.string "view_template"
      t.string "layout_template"
      t.boolean "draft", default: false
      t.string "link_url"
      t.string "ancestry"
      t.integer "position"
      t.string "materialized_path"
      t.boolean "active", default: true
    end

    create_table "spina_structure_items", id: :uuid, force: :cascade do |t|
      t.uuid "structure_id"
      t.integer "position"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "spina_structure_items", ["structure_id"], name: "index_spina_structure_items_on_structure_id", using: :btree

    create_table "spina_structure_parts", id: :uuid, force: :cascade do |t|
      t.uuid "structure_item_id"
      t.uuid "structure_partable_id"
      t.string "structure_partable_type"
      t.string "name"
      t.string "title"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "spina_structure_parts", ["structure_item_id"], name: "index_spina_structure_parts_on_structure_item_id", using: :btree
    add_index "spina_structure_parts", ["structure_partable_id"], name: "index_spina_structure_parts_on_structure_partable_id", using: :btree

    create_table "spina_structures", id: :uuid, force: :cascade do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "spina_texts", id: :uuid, force: :cascade do |t|
      t.text "content"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "spina_users", id: :uuid, force: :cascade do |t|
      t.string "name"
      t.string "email"
      t.string "password_digest"
      t.boolean "admin", default: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.datetime "last_logged_in"
    end

    create_table "spina_rewrite_rules", id: :uuid, force: :cascade do |t|
      t.string :old_path
      t.string :new_path
      t.timestamps
    end
  end
end
