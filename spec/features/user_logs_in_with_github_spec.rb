require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github oauth2" do
    visit root_path
    expect(page).to have_link("Sign in with Github")
    mock_auth_hash
    click_link "Sign in with Github"
    expect(page).to have_content("Mimi Le")
    expect(page).to have_link("Logout")
  end
end
