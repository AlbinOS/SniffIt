class RemoveBodyFromTastings < ActiveRecord::Migration
  def change
    remove_column :tastings, :body, :text
  end
end
