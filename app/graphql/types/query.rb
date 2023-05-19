module Types
  class Query < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :posts, [PostType], 'Returns all blog posts', null: false

    def posts
      Post.all
    end
  end
end
