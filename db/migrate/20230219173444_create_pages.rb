class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :name
       t.jsonb :defaults, null: false, default: '{}'

      t.timestamps
    end

    add_index :pages, :defaults, using: :gin
  end
end
