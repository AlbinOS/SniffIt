class CreateAftertastePersistences < ActiveRecord::Migration
  def change
    create_table :aftertaste_persistences do |t|
      t.integer :nature
      t.references :analysis_conclusion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
