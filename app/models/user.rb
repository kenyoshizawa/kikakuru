class User < ApplicationRecord
  has_many :user_events, dependent: :destroy
  has_many :events, through: :user_events
  has_many :messages

  enum role: { another: 0, friend: 1, organizer: 2 }

  validates :name, presence: true, length: { maximum: 10 }
  validates :role, presence: true
end
