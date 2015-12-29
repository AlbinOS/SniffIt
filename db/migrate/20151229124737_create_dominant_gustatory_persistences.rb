class CreateDominantGustatoryPersistences < ActiveRecord::Migration
  def change
    create_table :dominant_gustatory_persistences do |t|
      t.integer :nature
      t.references :analysis_conclusion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
