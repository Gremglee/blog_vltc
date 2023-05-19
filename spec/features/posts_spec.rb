require 'rails_helper'

RSpec.feature "Posts" do
  let!(:posts) { FactoryBot.create_list(:post, 4) }

  scenario "when a user views a post" do
    visit '/'
    click_link posts.first.title
    expect(page).to have_content posts.first.title
    expect(page).to have_content posts.first.content
  end
end
