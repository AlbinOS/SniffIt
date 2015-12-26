class Tasting < ActiveRecord::Base
  belongs_to :wine
  
  validates :taster, presence: true
  validates :body, presence: true
end
