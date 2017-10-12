module OmniauthMacros
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:github] =
    auth = {
    "provider"=>"github",
    "uid"=>1111111,
    "info"=>
    {"nickname"=>"Mimi",
    "email"=>"janedoe@gmail.com",
    "name"=>"Mimi Le",
    "urls"=>{"GitHub"=>"https://github.com/mimilettd", "Blog"=>""}},
    "credentials"=>{"token"=>ENV['github_token'], "expires"=>false},
    "extra"=>
    {"raw_info"=>
    {"login"=>"mimi",
     "id"=>75,
     "avatar_url"=>"https://avatars1.githubusercontent.com/u/26531775?v=4",
     "gravatar_id"=>"",
     "url"=>"https://api.github.com/users/mimilettd",
     "html_url"=>"https://github.com/mimilettd",
     "followers_url"=>"https://api.github.com/users/mimilettd/followers",
     "following_url"=>"https://api.github.com/users/mimilettd/following{/other_user}",
     "gists_url"=>"https://api.github.com/users/mimilettd/gists{/gist_id}",
     "starred_url"=>"https://api.github.com/users/mimilettd/starred{/owner}{/repo}",
     "subscriptions_url"=>"https://api.github.com/users/mimilettd/subscriptions",
     "organizations_url"=>"https://api.github.com/users/mimilettd/orgs",
     "repos_url"=>"https://api.github.com/users/mimilettd/repos",
     "events_url"=>"https://api.github.com/users/mimilettd/events{/privacy}",
     "received_events_url"=>"https://api.github.com/users/mimilettd/received_events",
     "type"=>"User",
     "site_admin"=>false,
     "name"=>"Mimi Le",
     "company"=>nil,
     "blog"=>"",
     "location"=>"Denver, CO",
     "email"=>"mimi@noneofyourbusiness.com",
     "hireable"=>nil,
     "bio"=>"Turing School of Software & Design\r\nBack-End Engineering Student",
     "public_repos"=>39,
     "public_gists"=>18,
     "followers"=>2,
     "following"=>3,
     "created_at"=>"2017-03-20T01:29:45Z",
     "updated_at"=>"2017-10-10T01:40:00Z"}}
    }
  end
end
