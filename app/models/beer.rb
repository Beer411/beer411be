class Beer < ActiveRecord::Base
  has_many :glasses
  has_many :bars, through: :glasses

  validates :name, presence: true, uniqueness: true
end
