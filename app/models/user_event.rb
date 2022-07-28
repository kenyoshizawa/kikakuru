class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum attendance: { unrelated: 0, read: 1, attendance: 2, absence: 3 }

  validates :user_id, uniqueness: { scope: :event_id }
  validates :attendance, presence: true
end
