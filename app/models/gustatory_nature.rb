class GustatoryNature < ActiveRecord::Base
  belongs_to :gustatory_analysis, inverse_of: :gustatory_natures

  validates :nature, :gustatory_analysis, presence: true
end
