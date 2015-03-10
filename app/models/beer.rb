class Beer < ActiveRecord::Base
  has_many :glasses
  has_many :bars, through :glasses
end
