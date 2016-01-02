class CreateVisualAnalyses < ActiveRecord::Migration
  def change
    create_table :visual_analyses do |t|
      t.integer :color
      t.integer :intensity
      t.integer :nuance
      t.integer :limpidity
      t.integer :brightness
      t.integer :density
      t.integer :effervescence
      t.references :tasting, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
