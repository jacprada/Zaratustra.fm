class AddLastfmAccountAndFetchToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lastfm_account, :string
    add_column :users, :fetch, :boolean
  end
end
