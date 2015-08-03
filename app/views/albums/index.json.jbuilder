json.array!(@albums) do |album|
  json.extract! album, :id, :title, :artist, :year, :cover_art, :review, :info_url, :user_id, :playlist_id
  json.url album_url(album, format: :json)
end
