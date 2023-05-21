require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:posts) { FactoryBot.create_list(:post, 4) }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET /posts" do
    it "contains the post title" do
      get "/posts"
      expect(response.body).to include posts.first.title
    end
  end

  describe "GET /posts/:id" do
    it "contains the post title" do
      get "/posts/#{posts.first.id}"
      expect(response.body).to include posts.first.title
    end
  end

  describe "POST /posts" do
    context "with valid parameters" do
      let(:valid_attributes) {
        {
          title: 'Post title',
          content: 'Post content.'
        }
      }

      it "creates a new Post" do
        expect {
          post posts_url, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
        post = Post.last

        expect(post.title).to eq('Post title')
        expect(post.content).to eq('Post content.')
      end
    end
  end

  describe "UPDATE /posts" do
    context "with valid parameters" do
      let(:valid_attributes) {
        {
          title: 'Post title',
          content: 'Post content.'
        }
      }

      it "creates a new Post" do
        expect {
          post posts_url, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
        post = Post.last

        expect(post.title).to eq('Post title')
        expect(post.content).to eq('Post content.')
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      subject(:post) { create(:post) }
      let(:new_attributes) { content("New content") }

      it "updates the requested post" do
        patch post_url(post), params: { post: new_attributes }
        subject.reload
        expect(subject.content).to eq("New content")
      end

      it "redirects to the post" do
        patch post_url(post), params: { post: new_attributes }
        post.reload
        expect(response).to redirect_to(post_url(subject))
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { content("") }

      it "renders a successful response" do
        patch post_url(post), params: { post: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete post_url(post)
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.create! valid_attributes
      delete post_url(post)
      expect(response).to redirect_to(posts_url)
    end
  end
end
