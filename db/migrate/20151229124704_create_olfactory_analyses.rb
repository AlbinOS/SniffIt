class CreateOlfactoryAnalyses < ActiveRecord::Migration
  def change
    create_table :olfactory_analyses do |t|
      t.integer :intensity
      t.integer :diversity
      t.integer :quality
      t.references :tasting, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
