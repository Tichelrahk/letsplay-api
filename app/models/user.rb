class User < ApplicationRecord
  has_many :events
  has_many :confirmations, dependent: :destroy
  acts_as_favoritor
end
