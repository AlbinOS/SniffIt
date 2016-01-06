class ChangeColumnsNotNull < ActiveRecord::Migration
  def change
    change_column_null :aftertaste_persistences, :analysis_conclusion_id, false
    change_column_null :aftertaste_persistences, :nature, false

    change_column_null :analysis_conclusions, :tasting_id, false

    change_column_null :dominant_gustatory_persistences, :analysis_conclusion_id, false
    change_column_null :dominant_gustatory_persistences, :nature, false

    change_column_null :gustatory_natures, :gustatory_analysis_id, false
    change_column_null :gustatory_natures, :nature, false

    change_column_null :olfactory_analyses, :tasting_id, false

    change_column_null :olfactory_natures, :olfactory_analysis_id, false
    change_column_null :olfactory_natures, :nature, false

    change_column_null :tastings, :wine_id, false
    change_column_null :tastings, :user_id, false

    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false

    change_column_null :wine_natures, :wine_id, false
    change_column_null :wine_natures, :grape_id, false

    change_column_null :wines, :domaine, false
    change_column_null :wines, :alcohol_rate, false
  end
end
