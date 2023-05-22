require 'rails_helper'

RSpec.describe Mutations::CreateComment, type: :request do
  describe 'POST /graphql' do
    let(:user) { create(:user, name: 'John Doe') }
    let(:commentable_post) { create(:post, title: 'Test Post', content: 'Test Content', author: user) }
    let(:query) do
      <<~GQL
        mutation CreateComment($postId: ID!, $content: String!) {
          createComment(postId: $postId, content: $content) {
            comment {
              id
              content
              user {
                id
                name
              }
              post {
                id
                title
              }
            }
            errors
          }
        }
      GQL
    end

    before do
      sign_in user
    end

    it 'creates a new comment' do
      variables = {
        postId: commentable_post.id.to_s,
        content: 'New Comment Content'
      }

      post '/graphql', params: { query: query, variables: variables }

      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body)
      data = json_response['data']['createComment']
      comment = data['comment']
      errors = data['errors']

      expect(errors).to be_empty
      expect(comment).to include(
        'id' => be_present,
        'content' => 'New Comment Content',
        'user' => {
          'id' => user.id.to_s,
          'name' => user.name
        },
        'post' => {
          'id' => commentable_post.id.to_s,
          'title' => commentable_post.title
        }
      )
    end

    it 'returns an error if post is not found' do
      variables = {
        postId: 'invalid-post-id',
        content: 'New Comment Content'
      }

      post '/graphql', params: { query: query, variables: variables }

      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body)
      data = json_response['data']['createComment']
      comment = data['comment']
      errors = data['errors']

      expect(comment).to be_nil
      expect(errors).to include('Post not found')
    end

    it 'returns an error if user is not authorized to create a comment' do
      variables = {
        postId: commentable_post.id.to_s,
        content: 'New Comment Content'
      }

      user.role_id = 4 #readonly

      post '/graphql', params: { query: query, variables: variables }

      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body)
      data = json_response['data']['createComment']
      comment = data['comment']
      errors = data['errors']

      expect(comment).to be_nil
      expect(errors).to include("User can't create comments")
    end
  end
end
