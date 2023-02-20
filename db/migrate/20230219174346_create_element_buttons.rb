class CreateElementButtons < ActiveRecord::Migration[7.0]
  def change
    create_table :element_buttons do |t|
      t.string :label
      t.string :href
      t.jsonb :options, null: false, default: '{}'

      t.timestamps
    end

    add_index :element_buttons, :options, using: :gin
  end
end
