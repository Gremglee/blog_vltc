module Mutations
  class CreateComment < BaseMutation
    null true
    argument :post_id, ID, required: true
    argument :content, String, required: true

    field :comment, Types::CommentType, null: true
    field :errors, [String], null: false

    def resolve(post_id:, content:)
      post = Post.find_by(id: post_id)

      if post.nil?
        return {
          comment: nil,
          errors: ["Post not found"]
        }
      end

      comment = post.comments.build(content: content, user: current_user)

      authorize(comment, :create?)

      if comment.save
        {
          comment: comment,
          errors: []
        }
      else
        {
          comment: nil,
          errors: comment.errors.full_messages
        }
      end
    rescue Pundit::NotAuthorizedError
      return {
        comment: nil,
        errors: ["User can't create comments"]
      }
    end
  end
end
