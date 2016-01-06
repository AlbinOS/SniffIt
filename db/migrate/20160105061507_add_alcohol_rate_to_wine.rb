class AddAlcoholRateToWine < ActiveRecord::Migration
  def change
    add_column :wines, :alcohol_rate, :integer
  end
end
