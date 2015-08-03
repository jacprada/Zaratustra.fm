Album.delete_all

# LastFM.api_key     = "75003985c11f78b76ce846ceac87e15a"
# LastFM.client_name = "My awesome app"

# def seedz username
#   LastFM::User.get_top_albums(:user => username)
# end

# result = seedz("chiefkatanga")

# result["topalbums"]["album"].each do |item|
#   new_album = Album.create(title: item["name"], artist: item["artist"]["name"], cover_art: item["image"][3]["#text"], info_url: item["url"], user_id: 1)
# end