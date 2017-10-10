require 'rails_helper'

def stub_omniauth
  # first, set OmniAuth to run in test mode
  OmniAuth.config.test_mode = true
  # then, provide a set of fake oauth data that
  # omniauth will use when a user tries to authenticate:
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    "provider"=>"github",
    "uid"=>26531775,
    "info"=>
    {"nickname"=>"mimilettd",
    "email"=>"mimilettd@gmail.com",
    "name"=>"Mimi Le",
    "urls"=>{"GitHub"=>"https://github.com/mimilettd", "Blog"=>""}},
    "credentials"=>{"token"=>"0f2d4d8aa68e0cad348ace9cedfaf3ae99426ae1", "expires"=>false},
    "extra"=>
    {"raw_info"=>
    {"login"=>"mimilettd",
     "id"=>26531775,
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
     "email"=>"mimilettd@gmail.com",
     "hireable"=>nil,
     "bio"=>"Turing School of Software & Design\r\nBack-End Engineering Student",
     "public_repos"=>39,
     "public_gists"=>18,
     "followers"=>2,
     "following"=>3,
     "created_at"=>"2017-03-20T01:29:45Z",
     "updated_at"=>"2017-10-10T01:40:00Z"}}
  })
end

RSpec.feature "user logs in" do
  scenario "using github oauth2" do
    stub_omniauth
    visit root_path
    expect(page).to have_link("Sign in with Github")
    click_link "Sign in with Github"
    expect(page).to have_content("Mimi Le")
    expect(page).to have_link("Logout")
  end
end
