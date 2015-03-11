class Bar < ActiveRecord::Base
  has_many :glasses
  has_many :beers, through: :glasses
end
