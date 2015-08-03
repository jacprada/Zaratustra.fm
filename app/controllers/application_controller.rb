class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?
  helper_method :authenticate

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

  def seedz(username, id)
    LastFM.api_key     = "75003985c11f78b76ce846ceac87e15a"
    LastFM.client_name = "My awesome app"
    result = LastFM::User.get_top_albums(:user => username)
    result["topalbums"]["album"].each do |item|
      new_album = Album.create(title: item["name"], artist: item["artist"]["name"], cover_art: item["image"][3]["#text"], info_url: item["url"], user_id: id)
    end
  end

end
