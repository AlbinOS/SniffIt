class OlfactoryAnalysis < ActiveRecord::Base
  belongs_to :tasting, inverse_of: :olfactory_analysis

  enum intensity: [:very_weak, :low, :pretty_weak, :normal, :relatively_aromatic, :aromatic, :powerful]
  enum diversity: [:aromatic_simple, :rich, :complex]
  enum quality: [:gross, :vulgar, :ordinary, :fine, :distinguished]

  has_many :olfactory_natures
  has_many :retro_olfactory_natures, class_name: 'OlfactoryNature'
end
