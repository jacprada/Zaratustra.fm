class RenameFetchDataInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :fetch_data?, :fetch_data
  end
end
