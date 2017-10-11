# As a user
# When I visit "/"
# And click on 'Login with Github'
# And enter in my username and password
# Then my path should be "/#{username}"
# And I should see a profile pic, name, username, bio

require 'rails_helper'

feature "As a user" do
  scenario "User can view basic information about their account" do
    visit '/'

    mock_auth_hash

    click_link "Sign in with Github"

    expect(page).to have_css("img[src=\"#{"https://avatars1.githubusercontent.com/u/26531775?v=4"}\"]")
    expect(page).to have_content("Mimi Le")
    expect(page).to have_content("Mimi")
    expect(page).to have_content("mimi@noneofyourbusiness.com")
    expect(page).to have_content("Denver, CO")
    expect(page).to have_content("Turing School of Software & Design\r\nBack-End Engineering Student")
  end
end
