class Grape < ActiveRecord::Base
  enum color: [:white, :black]

  validates :name, :color, presence: :true
end
