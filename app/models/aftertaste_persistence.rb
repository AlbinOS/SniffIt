class AftertastePersistence < ActiveRecord::Base
  belongs_to :analysis_conclusion, inverse_of: :aftertaste_persistences

  validates :analysis_conclusion, presence: true
  validates :nature, presence: true
end
