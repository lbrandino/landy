class CreateElementH2s < ActiveRecord::Migration[7.0]
  def change
    create_table :element_h2s do |t|
      t.string :title
      t.jsonb :options, null: false, default: '{}'

      t.timestamps
    end

    add_index :element_h2s, :options, using: :gin
  end
end
