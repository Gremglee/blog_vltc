require 'rails_helper'

RSpec.describe Mutations::CreatePost, type: :request do
  describe 'POST /graphql' do
    let(:user) { create(:user) }
    let(:query) do
      <<~GQL
        mutation CreatePost($title: String!, $content: String!, $authorId: ID!) {
          createPost(title: $title, content: $content, authorId: $authorId) {
            post {
              id
              title
              content
            }
            errors
          }
        }
      GQL
    end

    before do
      sign_in user
    end

    it 'creates a new post' do
      variables = {
        title: 'New Post Title',
        content: 'New Post Content',
        authorId: user.id.to_s
      }

      post '/graphql', params: { query: query, variables: variables }

      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body)
      data = json_response['data']['createPost']
      post = data['post']
      errors = data['errors']

      expect(errors).to be_empty
      expect(post).to include(
        'id' => be_present,
        'title' => 'New Post Title',
        'content' => 'New Post Content'
      )
    end
  end
end
