class RetroOlfactoryNature < ActiveRecord::Base
  belongs_to :olfactory_analysis, inverse_of: :olfactory_natures

  validates :olfactory_analysis, presence: true
  validates :nature, presence: true
end
