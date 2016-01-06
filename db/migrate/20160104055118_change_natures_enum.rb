class ChangeNaturesEnum < ActiveRecord::Migration
  def change
    change_column :olfactory_natures, :nature, :string
    change_column :gustatory_natures, :nature, :string
    change_column :dominant_gustatory_persistences, :nature, :string
  end
end
