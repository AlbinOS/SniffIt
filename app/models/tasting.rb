class Tasting < ActiveRecord::Base
  belongs_to :wine, inverse_of: :tastings
  belongs_to :user, inverse_of: :tastings

  has_one :visual_analysis, dependent: :destroy, inverse_of: :tasting, autosave: true
  has_one :olfactory_analysis, dependent: :destroy, inverse_of: :tasting, autosave: true
  has_one :gustatory_analysis, dependent: :destroy, inverse_of: :tasting, autosave: true
  has_one :analysis_conclusion, dependent: :destroy, inverse_of: :tasting, autosave: true
end
