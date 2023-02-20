class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.integer :order
      t.belongs_to :page, null: false, foreign_key: true
      # t.belongs_to :content, null: false, foreign_key: true
      # t.references :content, polymorphic: true, null: false

      t.timestamps
    end
  end
end
