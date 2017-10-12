class UsersController < ApplicationController
  def index
    @repositories = GithubService.new(current_user).retrieve_repositories.sort_by &:updated_at
    @starred_repos = GithubService.new(current_user).retrieve_starred_repos
    @followers = GithubService.new(current_user).retrieve_other_users_partial_info("followers")
  end
end
