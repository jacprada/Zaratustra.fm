class RemoveProfileImageFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :profile_image
    remove_column :users, :background_image
    remove_column :users, :profile_img
  end
end
