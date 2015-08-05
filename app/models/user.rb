class User < ActiveRecord::Base
  has_secure_password
  mount_uploader :profile_image, ProfileImageUploader
  mount_uploader :background_image, BackgroundImageUploader

  has_many :playlists
  has_many :albums

  validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :name, length: { maximum: 20 }
  validates :bio, length: { maximum: 140 }
end
