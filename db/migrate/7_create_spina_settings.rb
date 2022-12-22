class CreateSpinaSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :spina_settings, id: :uuid do |t|
      t.string :plugin
      t.jsonb :preferences, default: {}
      t.timestamps
    end

    add_index :spina_settings, :plugin
  end
end
