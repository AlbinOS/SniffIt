class VisualAnalysis < ActiveRecord::Base
  belongs_to :tasting, inverse_of: :visual_analysis

  enum intensity: [:colorless, :very_pale, :pale, :clear, :relatively_clear, :deep, :dark, :very_dark]
  enum nuance: [:grayed, :green, :golden, :straw, :onionskin, :salmon, :orange, :copper, :amber, :purplish, :ruby, :garnet, :tile, :brown, :maroon]
  enum limpidity: [:troubled, :veiled, :limpid]
  enum brightness: [:dull, :bright, :crystalline]
  enum density: [:fluid, :dense, :thick, :treacly]
  enum effervescence: [:still, :beading, :sparkling]

end
