class RemoveColorFromVisualAnalysis < ActiveRecord::Migration
  def change
    remove_column :visual_analyses, :color, :integer
  end
end
