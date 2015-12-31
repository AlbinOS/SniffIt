class AddReferenceToTasting < ActiveRecord::Migration
  def change
    add_reference :tastings, :user, index: true, foreign_key: true
  end
end
