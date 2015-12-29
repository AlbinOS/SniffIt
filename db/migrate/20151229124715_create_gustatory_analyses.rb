class CreateGustatoryAnalyses < ActiveRecord::Migration
  def change
    create_table :gustatory_analyses do |t|
      t.integer :acidity
      t.integer :alcohol
      t.integer :mellowness
      t.integer :tannin_quantity
      t.integer :tannin_quality
      t.references :tasting, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
