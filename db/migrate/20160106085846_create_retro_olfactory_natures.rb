class CreateRetroOlfactoryNatures < ActiveRecord::Migration
  def change
    create_table :retro_olfactory_natures do |t|
      t.string :nature
      t.references :olfactory_analysis, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
