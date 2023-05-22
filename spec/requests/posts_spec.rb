require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:user) { create(:user, :admin) }
  let(:valid_attributes) {
    {
      title: 'Post title',
      content: 'Post content.'
    }
  }

  subject { create(:post) }

  before do
    sign_in user
  end

  describe "GET /posts" do
    it "contains the post title" do
      subject
      get "/posts"
      expect(response.body).to include subject.title
    end
  end

  describe "GET /posts/:id" do
    it "contains the post title" do
      get "/posts/#{subject.id}"
      expect(response.body).to include subject.title
    end
  end

  describe "POST /posts" do
    context "with valid parameters" do
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
      let(:new_attributes) { { content: "New content" } }

      it "updates the requested post" do
        patch post_url(subject), params: { post: new_attributes }
        subject.reload
        expect(subject.content).to eq("New content")
      end

      it "redirects to the post" do
        patch post_url(subject), params: { post: new_attributes }
        subject.reload
        expect(response).to redirect_to(post_url(subject))
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { content: nil } }

      it "raises an exception" do
        patch post_url(subject), params: { post: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested post" do
      subject
      expect {
        delete post_url(subject)
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      delete post_url(subject)
      expect(response).to redirect_to(posts_url)
    end
  end
end
