class CreateSpinaTranslationTables < ActiveRecord::Migration[4.2]
  def up
    create_table "spina_page_translations", id: :uuid, force: :cascade do |t|
      t.uuid "spina_page_id", null: false
      t.string "locale", null: false
      t.string "title"
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
  end

  def down
    drop_table "spina_page_translations"
    drop_table "spina_text_translations"
    drop_table "spina_line_translations"
  end
end
