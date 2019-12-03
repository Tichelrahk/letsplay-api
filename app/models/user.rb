class User < ApplicationRecord
  has_many :events
  has_many :confirmations, dependent: :destroy
end
