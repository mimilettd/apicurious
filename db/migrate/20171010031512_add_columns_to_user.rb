class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :token, :string
    add_column :users, :profile_picture, :string
    add_column :users, :url, :string
    add_column :users, :followers_url, :string
    add_column :users, :following_url, :string
    add_column :users, :gists_url, :string
    add_column :users, :bio, :string
    add_column :users, :location, :string
    add_column :users, :email, :string
    add_column :users, :repo_url, :string
    add_column :users, :starred_url, :string
    add_column :users, :followers, :string
    add_column :users, :following, :string
    add_column :users, :public_repos, :string
    add_column :users, :public_gists, :string
  end
end
