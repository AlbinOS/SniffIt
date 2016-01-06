class CreateWineNatures < ActiveRecord::Migration
  def change
    create_table :wine_natures do |t|
      t.references :wine, index: true, foreign_key: true
      t.references :grape, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
