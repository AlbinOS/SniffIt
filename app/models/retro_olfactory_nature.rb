class RetroOlfactoryNature < ActiveRecord::Base
  belongs_to :olfactory_analysis, inverse_of: :olfactory_natures

  validates :nature, :olfactory_analysis, presence: true
end
