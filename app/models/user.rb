class User < ActiveRecord::Base
  has_secure_password

  has_many :playlists
  has_many :albums

  validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :name, length: { maximum: 20 }
  validates :bio, length: { maximum: 140 }
end
