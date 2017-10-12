require 'rails_helper'

feature "User visits profile page" do
  scenario "and can see all repositories" do
    visit '/'

    mock_auth_hash

    click_link "Sign in with Github"

    expect(current_path).to eq('/mimilettd')

    within(:css, "div#profile") do
      expect(page).to have_content("little_shop_of_funsies")
      expect(page).to have_content("core-types")
      expect(page).to have_content("career-development-curriculum")
      expect(page).to have_content("credit_check")
      expect(page).to have_content("date_night")
      expect(page).to have_content("complete_me")
    end

  end
end
