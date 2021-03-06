class GithubService
  def initialize(current_user)
    @current_user = current_user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
    faraday.adapter  Faraday.default_adapter
    end
  end

  def retrieve_repositories
    response = @conn.get("/users/#{current_user.username}/repos?access_token=#{current_user.token}")
    raw_data = JSON.parse(response.body, symbolize_names: true)
    create_repo_objects(raw_data)
  end

  def retrieve_starred_repos
    response = @conn.get("/users/#{current_user.username}/starred?access_token=#{current_user.token}")
    raw_data = JSON.parse(response.body, symbolize_names: true)
    create_repo_objects(raw_data)
  end

  def retrieve_other_users_partial_info(type)
    response = @conn.get("/users/#{current_user.username}/#{type}?access_token=#{current_user.token}")
    raw_data = JSON.parse(response.body, symbolize_names: true)
    parse_other_users(raw_data)
  end

  def parse_other_users(raw_data)
    raw_data.map do |object|
      retrieve_other_users_full_info(object)
    end
  end

  def retrieve_other_users_full_info(object)
    response = @conn.get("/users/#{object[:login]}?access_token=#{current_user.token}")
    raw_data = JSON.parse(response.body, symbolize_names: true)
    create_other_user_objects(raw_data)
  end

  def parse_repositories(repository_array)
    repository_array.map do |repository|
      retrieve_recent_commits(repository)
    end
  end

  def retrieve_recent_commits(repository)
    response = @conn.get("/repos/#{current_user.username}/#{repository.name}/stats/participation?access_token=#{current_user.token}")
    raw_data = JSON.parse(response.body, symbolize_names: true)
    create_commit_objects(raw_data, repository.name)
  end

  def create_commit_objects(raw_data, repository)
    Commit.new(raw_data, repository) unless raw_data.empty? || raw_data[:owner][-1] == 0
  end

  def create_other_user_objects(raw_data)
    OtherUser.new(raw_data)
  end

  def create_repo_objects(repositories)
    repositories.map do |raw_data|
      Repository.new(raw_data)
    end
  end

  private
    attr_reader :conn, :current_user
end
