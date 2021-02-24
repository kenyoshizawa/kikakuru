class User < ApplicationRecord
  has_many :user_events, dependent: :destroy
  has_many :events, through: :user_events

  enum role: { friend: 0, organizer: 1 }

  validates :name, presence: true, length: { maximum: 10 }
  validates :role, presence: true
end
