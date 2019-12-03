class Event < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :confirmations, dependent: :destroy
end
