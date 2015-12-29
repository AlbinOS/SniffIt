class OlfactoryAnalysis < ActiveRecord::Base
  belongs_to :tasting

  enum intensity: [:very_weak, :low, :pretty_weak, :average, :very_aromatic, :aromatic, :powerful]
  enum diversity: [:aromatic, :rich, :complex]
  enum quality: [:gross, :vulgar, :ordinary, :fine, :distinguished]

  has_many :olfactory_natures
  has_many :retro_olfactory_natures, class_name: 'OlfactoryNature'
end
