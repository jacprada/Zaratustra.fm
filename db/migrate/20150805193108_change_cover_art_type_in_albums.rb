class ChangeCoverArtTypeInAlbums < ActiveRecord::Migration
  def change
    change_column :albums, :cover_art, :string
  end
end
