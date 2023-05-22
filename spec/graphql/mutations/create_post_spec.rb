require 'rails_helper'

module Mutations
  RSpec.describe CreatePost, type: :request do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    describe '.resolve' do
      it 'creates a post' do
        expect do
          post '/graphql', params: { query: query(author_id: user.id) }
        end.to change { Post.count }.by(1)
      end

      it 'returns a post' do
        post '/graphql', params: { query: query(author_id: user.id) }
        json = JSON.parse(response.body)
        data = json['data']['Post']

        expect(data).to include(
          'id'              => be_present,
          'title'           => 'Blog post title',
          'content'         => 'Post content',
          'author'          => { 'id' => user.id.to_s }
        )
      end
    end

    def query(author_id:)
      <<~GQL
        mutation {
          createPost(
            authorId: #{author_id}
            title: Blog post title
            genre: Post content'
          ) {
            id
            title
            content
            author {
              id
            }
          }
        }
      GQL
    end
  end
end

# module Posts
#   RSpec.describe CreatePost, type: :request do
#     describe '.resolve' do
#       it 'creates a post' do
#         author = create(:user)

#         expect do
#           post '/graphql', params: { query: query(author_id: author.id) }
#         end.to change { Post.count }.by(1)
#       end

#       it 'returns a post' do
#         author = create(:user)

#         post '/graphql', params: { query: query(author_id: author.id) }
#         json = JSON.parse(response.body)
#         data = json['data']['Post']

#         expect(data).to include(
#           'id'              => be_present,
#           'title'           => 'Blog post title',
#           'content'         => 'Post content',
#           'author'          => { 'id' => author.id.to_s }
#         )
#       end
#     end

#     def query(author_id:)
#       <<~GQL
#         mutation {
#           createPost(
#             authorId: #{author_id}
#             title: Blog post title
#             genre: Post content'
#           ) {
#             id
#             title
