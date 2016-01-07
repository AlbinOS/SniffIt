class AddColorToWine < ActiveRecord::Migration
  def change
    add_column :wines, :color, :integer, null: false
  end
end
