class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.belongs_to :page, null: false, foreign_key: true
      t.string :content_kind
      t.jsonb :options, null: false, default: '{}'

      t.timestamps
    end

    add_index :contents, :options, using: :gin
  end
end
