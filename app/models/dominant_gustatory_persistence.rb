class DominantGustatoryPersistence < ActiveRecord::Base
  belongs_to :analysis_conclusion, inverse_of: :dominant_gustatory_persistences

  validates :analysis_conclusion, presence: true
  validates :nature, presence: true
end
