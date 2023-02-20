class CreateElementH1s < ActiveRecord::Migration[7.0]
  def change
    create_table :element_h1s do |t|
      t.string :title
      t.jsonb :options, null: false, default: '{}'

      t.timestamps
    end

    add_index :element_h1s, :options, using: :gin
  end
end
