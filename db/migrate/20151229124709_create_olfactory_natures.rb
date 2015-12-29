class CreateOlfactoryNatures < ActiveRecord::Migration
  def change
    create_table :olfactory_natures do |t|
      t.integer :nature
      t.references :olfactory_analysis, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
