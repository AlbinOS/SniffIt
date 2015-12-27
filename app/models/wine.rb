class Wine < ActiveRecord::Base
  has_many :tastings, dependent: :destroy

  validates :appellation, presence: true

  validates :domaine, presence: true

  validates :vintage, numericality: { allow_blank: true, only_integer: true, greater_than_or_equal_to: Time.zone.now.year - 100, less_than_or_equal_to: Time.zone.now.year}
end
