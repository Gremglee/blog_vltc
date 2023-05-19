module Types
  class Subscription < GraphQL::Schema::Object
    field :comment_added, subscription: Subscriptions::CommentAdded
  end
end
