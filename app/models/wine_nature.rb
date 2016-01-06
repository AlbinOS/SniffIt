class WineNature < ActiveRecord::Base
  belongs_to :wine
  belongs_to :grape

  validates :wine, presence: true
  validates :grape, presence: true
end
