class UsersController < ApplicationController
  def index
    @repositories = GithubService.new(current_user).retrieve_repositories.sort_by &:updated_at
  end
end
