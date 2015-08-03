class User < ActiveRecord::Base
  has_secure_password

  has_many :playlists
  has_many :albums

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  # before_create :seedz

  # def seedz
  #   LastFM.api_key     = "75003985c11f78b76ce846ceac87e15a"
  #   LastFM.client_name = "My awesome app"
  #   result = LastFM::User.get_top_albums(:user => "faranakz")
  #   result["topalbums"]["album"].each do |item|
  #     new_album = Album.create(title: item["name"], artist: item["artist"]["name"], cover_art: item["image"][3]["#text"], info_url: item["url"], user_id: 1)
  #   end
  # end

end
