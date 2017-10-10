require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates or updates itself from an oauth hash" do
    auth = {
    "provider"=>"github",
    "uid"=>1111111,
    "info"=>
    {"nickname"=>"mimilettd",
    "email"=>"mimilettd@gmail.com",
    "name"=>"Mimi Le",
    "urls"=>{"GitHub"=>"https://github.com/mimilettd", "Blog"=>""}},
    "credentials"=>{"token"=>"99426ae1", "expires"=>false},
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

    User.create_with_omniauth(auth)
    new_user = User.first

    expect(new_user.provider).to eq("github")
    expect(new_user.uid).to eq("1111111")
    expect(new_user.email).to eq("mimi@noneofyourbusiness.com")
    expect(new_user.name).to eq("Mimi Le")
    expect(new_user.username).to eq("mimi")
    expect(new_user.token).to eq("99426ae1")
  end
end
