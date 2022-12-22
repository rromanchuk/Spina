class CreateSpinaTables < ActiveRecord::Migration[4.2]
  def up
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
      t.jsonb "json_attributes"
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
      t.boolean "show_in_menu", default: true
      t.string "slug"
      t.boolean "deletable", default: true
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "name"
      t.boolean "skip_to_first_child", default: false
      t.string "view_template"
      t.string "layout_template"
      t.boolean "draft", default: false
      t.string "link_url"
      t.string "ancestry"
      t.integer "position"
      t.boolean "active", default: true
      t.jsonb "json_attributes"
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
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "spina_users", id: :uuid, force: :cascade do |t|
      t.string "name"
      t.string "email"
      t.string "password_digest"
      t.string "password_reset_token"
      t.datetime "password_reset_sent_at"
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

    create_table "spina_page_translations", id: :uuid, force: :cascade do |t|
      t.uuid "spina_page_id", null: false
      t.string "locale", null: false
      t.string "title"
      t.string "url_title"
      t.string "menu_title"
      t.string "description"
      t.string "seo_title"
      t.string "materialized_path"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["locale"], name: "index_spina_page_translations_on_locale"
      t.index ["spina_page_id"], name: "index_spina_page_translations_on_spina_page_id"
    end

    create_table "spina_line_translations", id: :uuid, force: :cascade do |t|
      t.uuid "spina_line_id", null: false
      t.string "locale", null: false
      t.string "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["locale"], name: "index_spina_line_translations_on_locale"
      t.index ["spina_line_id"], name: "index_spina_line_translations_on_spina_line_id"
    end

    create_table "spina_text_translations", id: :uuid, force: :cascade do |t|
      t.uuid "spina_text_id", null: false
      t.string "locale", null: false
      t.text "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["locale"], name: "index_spina_text_translations_on_locale"
      t.index ["spina_text_id"], name: "index_spina_text_translations_on_spina_text_id"
    end

    create_table "spina_navigations", id: :uuid, force: :cascade do |t|
      t.string "name", null: false
      t.string "label", null: false
      t.boolean "auto_add_pages", null: false, default: false
      t.integer "position", default: 0, null: false
      t.timestamps
      t.index ["name"], name: "index_spina_navigations_on_name", unique: true, using: :btree
    end

    create_table "spina_navigation_items", id: :uuid, force: :cascade do |t|
      t.uuid "page_id", null: false
      t.uuid "navigation_id", null: false
      t.integer "position", default: 0, null: false
      t.string "ancestry"
      t.timestamps
      t.index ["page_id", "navigation_id"], name: "index_spina_navigation_items_on_page_id_and_navigation_id", unique: true, using: :btree
    end
  
    create_table :spina_options, id: :uuid do |t|
      t.string :value
      t.timestamps
    end

    create_table :spina_settings, id: :uuid do |t|
      t.string :plugin
      t.jsonb :preferences, default: {}
      t.timestamps
    end

    add_index :spina_settings, :plugin

    create_table :spina_media_folders, id: :uuid do |t|
      t.string :name
      t.timestamps
    end

    create_table :spina_images, id: :uuid do |t|
      t.uuid :media_folder_id

      t.timestamps
    end
    add_index :spina_images, :media_folder_id

    create_table :spina_image_collections, id: :uuid do |t|
      t.timestamps
    end

    create_table "spina_image_collections_images", id: :uuid, force: :cascade do |t|
      t.uuid :image_collection_id
      t.uuid :image_id
      t.integer :position
    end

    add_index :spina_image_collections_images, :image_collection_id
    add_index :spina_image_collections_images, :image_id

    create_table :spina_resources, id: :uuid do |t|
      t.string :name, null: false, unique: true
      t.string :label
      t.string :view_template
      t.string :order_by
      t.jsonb :slug
      t.timestamps
    end

    add_column :spina_pages, :resource_id, :uuid, null: true
    add_index :spina_pages, :resource_id
  end

  def down
    drop_table :spina_users
    drop_table :spina_texts
    drop_table :spina_text_translations
    drop_table :spina_structures
    drop_table :spina_structure_parts
    drop_table :spina_structure_items
    drop_table :spina_settings
    drop_table :spina_rewrite_rules
    drop_table :spina_resources
    drop_table :spina_pages
    drop_table :spina_page_translations
    drop_table :spina_page_parts
    drop_table :spina_options
    drop_table :spina_navigations
    drop_table :spina_navigation_items
    drop_table :spina_media_folders
    drop_table :spina_lines
    drop_table :spina_line_translations
    drop_table :spina_images
    drop_table :spina_image_collections_images
    drop_table :spina_image_collections
    drop_table :spina_attachments
    drop_table :spina_attachment_collections_attachments
    drop_table :spina_attachment_collections
    drop_table :spina_accounts
    drop_table :spina_layout_parts
  end
end
