class ChangeNatureTypeOnAftertaste < ActiveRecord::Migration
  def change
    change_column :aftertaste_persistences, :nature, :string
  end
end
