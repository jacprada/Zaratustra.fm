Rails.application.routes.draw do
  get 'errors/file_not_found'

  get 'errors/unprocessable'

  get 'errors/internal_server_error'

  get "/albums", to: redirect("/users")
  get "/playlists", to: redirect("/users")

  resources :albums
  resources :playlists
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root "static#home"
  get "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"

  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  resources :albums do
    member do
      put "like", to: "albums#upvote"
      put "dislike", to: "albums#downvote"
    end
  end
end
