class ChangeAlcoholRateTypeToFloat < ActiveRecord::Migration
  def change
    change_column :wines, :alcohol_rate, :float, null: false
  end
end
