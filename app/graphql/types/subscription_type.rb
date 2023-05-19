module Types
  class SubscriptionType < GraphQL::Schema::Object
    field :comment_added, subscription: Subscriptions::CommentAdded
  end
end
