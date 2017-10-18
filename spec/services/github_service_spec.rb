require 'rails_helper'

describe GithubService do

  describe "repositories" do
    it "finds all starred repositories" do
      VCR.use_cassette("services/find_starred_repos") do
        user = User.new(username: "mimilettd", token: ENV['github_token'])
        starred_repos = GithubService.new(user).retrieve_starred_repos

        expect(starred_repos.count).to eq(5)
        expect(starred_repos.first.full_name).to eq("Aram-Anderson/black_thursday")
      end
    end
  end
end
