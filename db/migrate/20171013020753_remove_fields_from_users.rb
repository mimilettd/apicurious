class RemoveFieldsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :url
    remove_column :users, :followers_url
    remove_column :users, :following_url
    remove_column :users, :gists_url
    remove_column :users, :repo_url
    remove_column :users, :starred_url
    remove_column :users, :followers
    remove_column :users, :following
    remove_column :users, :public_repos
    remove_column :users, :public_gists
  end
end
