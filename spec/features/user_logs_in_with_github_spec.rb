require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github oauth2" do
    visit root_path
    expect(page).to have_link("Login")
    mock_auth_hash
    click_link "Login"
    expect(page).to have_content("Mimi Le")
    expect(page).to have_link("Logout")
  end
end
