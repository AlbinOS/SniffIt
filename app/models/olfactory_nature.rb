class OlfactoryNature < ActiveRecord::Base
  belongs_to :olfactory_analysis

  enum nature: [:fresh_fruits, :processed_fruit, :flowers, :plants, :animals, :spices, :empyreumatic_odor, :red_fruits, :black_fruit, :yellow_fruit, :white_fruit, :citrus]
end
