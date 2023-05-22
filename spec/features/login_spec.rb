require 'rails_helper'

RSpec.feature "Posts" do
  let!(:user) { create(:user, password: '123123') }
  let!(:post) { create(:post) }

  scenario "when a user views a post" do
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: '123123'
    click_on "Log in"
    expect(page).to have_content post.title
  end
end
