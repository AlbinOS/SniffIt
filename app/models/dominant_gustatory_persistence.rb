class DominantGustatoryPersistence < ActiveRecord::Base
  belongs_to :analysis_conclusion, inverse_of: :dominant_gustatory_persistences

  validates :nature, :analysis_conclusion, presence: true
end
