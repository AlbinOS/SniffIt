class AnalysisConclusion < ActiveRecord::Base
  include Naturable
  belongs_to :tasting, inverse_of: :analysis_conclusion

  enum balance: [:balanced, :acid, :tannin, :mellow]
  enum pai: [:very_short, :short, :normal, :long, :very_long]
  enum overall_sentiment: [:insufficient, :poor, :homogeneous, :pleasant, :well_formed, :full]
  enum future: [:very_young, :young, :mature, :blooming, :evolved, :worn]

  has_many :dominant_gustatory_persistences, dependent: :destroy, inverse_of: :analysis_conclusion, autosave: true
  has_many :aftertaste_persistences, dependent: :destroy, inverse_of: :analysis_conclusion, autosave: true

  validates :tasting, presence: true
end
