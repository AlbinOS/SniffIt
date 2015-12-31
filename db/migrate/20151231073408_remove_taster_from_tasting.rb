class RemoveTasterFromTasting < ActiveRecord::Migration
  def change
    remove_column :tastings, :taster, :string
  end
end
