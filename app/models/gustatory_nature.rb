class GustatoryNature < ActiveRecord::Base
  belongs_to :gustatory_analysis

  enum nature: [:mellowness, :carbon_dioxide, :bitterness]
end
