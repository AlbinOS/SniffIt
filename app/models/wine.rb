class Wine < ActiveRecord::Base
  validates :appellation, presence: true
  validates :domaine, presence: true
  validates :vintage, numericality: { only_integer: true  }
end
