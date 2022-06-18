class Event < ApplicationRecord
  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events, dependent: :destroy
  has_many :schedules

  validates :title, presence: true, length: { maximum: 20 }
  validates :place, presence: true
  validates :started_at, presence: true
  validates :finished_at, presence: true
  validates :deadlined_at, presence: true
  # validates :url

  before_create -> { self.url = SecureRandom.uuid }
end
