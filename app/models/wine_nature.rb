class WineNature < ActiveRecord::Base
  belongs_to :wine
  belongs_to :grape

  validates :wine, :grape, presence: true
end
