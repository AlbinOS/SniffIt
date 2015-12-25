class CreateTastings < ActiveRecord::Migration
  def change
    create_table :tastings do |t|
      t.string :taster
      t.text :body
      t.references :wine, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
