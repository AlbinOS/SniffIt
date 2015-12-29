class CreateAnalysisConclusions < ActiveRecord::Migration
  def change
    create_table :analysis_conclusions do |t|
      t.integer :balance
      t.integer :pai
      t.integer :overall_sentiment
      t.integer :future
      t.references :tasting, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
