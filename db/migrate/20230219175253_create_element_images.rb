class CreateElementImages < ActiveRecord::Migration[7.0]
  def change
    create_table :element_images do |t|
      t.string :src
      t.jsonb :options, null: false, default: '{}'

      t.timestamps
    end

    add_index :element_images, :options, using: :gin
  end
end
