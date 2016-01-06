class ChangeColumnNotNull < ActiveRecord::Migration
  def change
    change_column_null :wines, :appellation, false
  end
end
