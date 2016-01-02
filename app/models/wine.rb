class Wine < ActiveRecord::Base
  belongs_to :user, inverse_of: :wines

  has_many :tastings, dependent: :destroy, inverse_of: :wine

  validates :appellation, presence: true
  validates :domaine, presence: true
  validates :vintage, numericality: { allow_blank: true, only_integer: true, greater_than_or_equal_to: Time.zone.now.year - 100, less_than_or_equal_to: Time.zone.now.year}

  def full_name
    "#{appellation}, #{vintage}, #{domaine}"
  end
end
