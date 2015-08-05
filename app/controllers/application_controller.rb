class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?
  helper_method :authenticate
  helper_method :get_playlists

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authenticate
    unless logged_in?
      flash[:error] = "You must be logged in to access the content of this website"
      redirect_to "/"
    end
  end

  def authenticate_user(user)
    if user != current_user
      flash[:error] = "You are not authorized to do that."
      redirect_to root_path
    end
  end

  def fetch_albums(account, id)
    LastFM.api_key     = ENV["LASTFM_APIKEY"]
    LastFM.client_name = "Zaratustra.fm"
    result = LastFM::User.get_top_albums(:user => account)
    result["topalbums"]["album"].each do |item|
      new_album = Album.create(title: item["name"], artist: item["artist"]["name"], cover_art: item["image"][3]["#text"], info_url: item["url"], user_id: id)
    end
  end

  def destroy_albums(id)
    albums_to_destroy = Album.where(:user_id => id)
    albums_to_destroy.destroy_all
  end

  def update_albums(account, id)
    destroy_albums(id)
    fetch_albums(account, id)
  end

end
