class CreateGustatoryNatures < ActiveRecord::Migration
  def change
    create_table :gustatory_natures do |t|
      t.integer :nature
      t.references :gustatory_analysis, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
