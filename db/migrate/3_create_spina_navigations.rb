class CreateSpinaNavigations < ActiveRecord::Migration[4.2]
  def change
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
  end
end
