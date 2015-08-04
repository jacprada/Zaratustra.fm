class Album < ActiveRecord::Base
  belongs_to :user
  belongs_to :playlist

  validates :title, presence: true
  validates :artist, presence: true
  validates :user_id, presence: true
  validates :review, length: { maximum: 140 }
end