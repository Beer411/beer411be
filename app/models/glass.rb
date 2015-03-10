class Glass < ActiveRecord::Base
  belongs_to :bar
  belongs_to :beer
end
