class Event < ApplicationRecord
  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events, dependent: :destroy
  has_many :schedules
  has_many :messages

  validates :title, presence: true, length: { maximum: 20 }
  validates :place, presence: true, place_format: true
  validates :started_at, presence: true
  validates :finished_at, presence: true
  validates_with EventRangeValidator, unless: -> { started_at.blank? || finished_at.blank? }
  validates :deadlined_at, presence: true

  before_create -> { self.url = SecureRandom.uuid }
end
