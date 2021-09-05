class Event < ApplicationRecord
  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events, dependent: :destroy

  validates :title, presence: true, length: { maximum: 20 }
  validates :place, length: { maximum: 200 }

  def split_id_from_youtube_url
    # YoutubeならIDのみ抽出
    identifier.split('/').last if youtube?
  end
end
