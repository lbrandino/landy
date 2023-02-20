class CreateComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :components do |t|
      t.belongs_to :content, null: false, foreign_key: true
      t.belongs_to :element, polymorphic: true, null: false

      t.timestamps
    end
  end
end
