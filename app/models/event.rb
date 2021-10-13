class Event < ApplicationRecord
  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events, dependent: :destroy

  # validates :title, presence: true, length: { maximum: 20 }
  # validates :place, length: { maximum: 200 }, place_url: true
  # validates :started_at
  # validates :finished_at
  # validates :deadlined_at
  # validates :url
end
