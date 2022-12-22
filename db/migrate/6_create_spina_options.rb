class CreateSpinaOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :spina_options, id: :uuid do |t|
      t.string :value
      t.timestamps
    end
  end
end
