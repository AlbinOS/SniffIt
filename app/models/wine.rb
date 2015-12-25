class Wine < ActiveRecord::Base
  has_many :tastings

  validates :appellation, presence: true
  validates :domaine, presence: true
  validates :vintage, numericality: { only_integer: true  }
end
