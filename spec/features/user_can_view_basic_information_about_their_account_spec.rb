require 'rails_helper'

feature "User" do
  scenario "Can view basic information about their account" do
    visit '/'

    mock_auth_hash

    click_link "Login"

    expect(page).to have_css("img[src=\"#{"https://avatars1.githubusercontent.com/u/26531775?v=4"}\"]")
    expect(page).to have_content("Mimi Le")
    expect(page).to have_content("Mimi")
    expect(page).to have_content("mimi@noneofyourbusiness.com")
    expect(page).to have_content("Denver, CO")
    expect(page).to have_content("Turing School of Software & Design\r\nBack-End Engineering Student")
  end
end
