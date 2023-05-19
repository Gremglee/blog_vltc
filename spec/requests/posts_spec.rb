require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
     let!(:posts) { FactoryBot.create_list(:post, 4) }
     let(:user) { create(:user) }

     before do
       sign_in user
     end

     it "contains the product names" do
        get "/posts"
        expect(response).to include posts.first.title
     end
  end
end
