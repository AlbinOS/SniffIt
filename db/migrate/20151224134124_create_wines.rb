class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :appellation
      t.integer :vintage
      t.string :domaine

      t.timestamps null: false
    end
  end
end
