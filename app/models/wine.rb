class Wine < ActiveRecord::Base
  belongs_to :user, inverse_of: :wines

  enum vinification_type: [:normal, :conversion, :bio, :biodynamic]

  has_many :tastings, dependent: :destroy, inverse_of: :wine
  has_many :wine_natures, dependent: :destroy, inverse_of: :wine
  has_many :grapes, through: :wine_natures

  validates :appellation, :domaine, :user, :alcohol_rate, presence: true
  validates :vintage, numericality: { allow_blank: true, only_integer: true, greater_than_or_equal_to: Time.zone.now.year - 100, less_than_or_equal_to: Time.zone.now.year}
  validates :alcohol_rate, numericality: { allow_blank: true, greater_than: 0, less_than_or_equal_to: 25 }

  def full_name
    "#{appellation}, #{vintage}, #{domaine}"
  end
end
