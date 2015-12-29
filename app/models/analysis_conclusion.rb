class AnalysisConclusion < ActiveRecord::Base
  belongs_to :tasting

  enum balance: [:balanced, :acid, :tannin, :mellow]
  enum pai: [:very_short, :short, :normal, :long, :very_long]
  enum overall_sentiment: [:insufficient, :poor, :homogeneous, :pleasant, :well_formed, :full]
  enum future: [:very_young, :young, :mature, :blooming, :evolved, :worn]

  has_many :dominant_gustatory_persistences
  has_many :aftertaste_gustatory_persistences, class_name: 'DominantGustatoryPersistence'
end
