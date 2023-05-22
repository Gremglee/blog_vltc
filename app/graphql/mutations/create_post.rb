module Mutations
  class CreatePost < BaseMutation
    null true
    argument :title, String, required: true
    argument :content, String, required: true
    argument :author_id, ID, required: true

    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    def resolve(title:, content:, author_id:)
      post = Post.new(title: title, content: content, author_id: author_id)

      if post.save
        {
          post: post,
          errors: []
        }
      else
        {
          post: nil,
          errors: post.errors.full_messages
        }
      end
    end
  end
end
