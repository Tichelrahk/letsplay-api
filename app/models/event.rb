class Event < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :confirmations, dependent: :destroy
  acts_as_favoritable
  acts_as_taggable_on :tags
  validates :image, presence: true
end
