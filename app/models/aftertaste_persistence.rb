class AftertastePersistence < ActiveRecord::Base
  belongs_to :analysis_conclusion, inverse_of: :aftertaste_persistences

  validates :nature, :analysis_conclusion, presence: true
end
