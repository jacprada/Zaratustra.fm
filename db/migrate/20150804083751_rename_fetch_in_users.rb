class RenameFetchInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :fetch, :fetch_data?
  end
end
