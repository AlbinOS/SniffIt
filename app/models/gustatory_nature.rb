class GustatoryNature < ActiveRecord::Base
  belongs_to :gustatory_analysis, inverse_of: :gustatory_natures

  validates :gustatory_analysis, presence: true
  validates :nature, presence: true
end
