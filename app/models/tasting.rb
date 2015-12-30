class Tasting < ActiveRecord::Base
  belongs_to :wine

  has_one :visual_analysis, dependent: :destroy
  has_one :olfactory_analysis, dependent: :destroy
  has_one :gustatory_analysis, dependent: :destroy
  has_one :analysis_conclusion, dependent: :destroy

  validates :taster, presence: true
end
