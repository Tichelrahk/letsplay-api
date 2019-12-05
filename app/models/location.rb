class Location < ApplicationRecord
  has_many :events
  validates :longitude, presence: true
  validates :latitude, presence: true
end
