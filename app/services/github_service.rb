class GithubService
  def initialize(current_user)
    @current_user = current_user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
    faraday.headers["Token"] = current_user.token
    faraday.adapter  Faraday.default_adapter
    end
  end

  def retrieve_repositories
    response = @conn.get(current_user.repo_url)
    raw_data = JSON.parse(response.body, symbolize_names: true)
    create_repo_objects(raw_data)
  end

  def create_repo_objects(repositories)
    repositories.map do |raw_data|
      Repository.new(raw_data)
    end
  end

  private
    attr_reader :conn, :current_user
end
