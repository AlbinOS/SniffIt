class Grape < ActiveRecord::Base
  enum color: [:white, :red]

  validates :name, :color, presence: :true
end
