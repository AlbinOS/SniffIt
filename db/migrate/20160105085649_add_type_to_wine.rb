class AddTypeToWine < ActiveRecord::Migration
  def change
    add_column :wines, :vinification_type, :integer
  end
end
