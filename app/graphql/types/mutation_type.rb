module Types
  class MutationType < GraphQL::Schema::Object
    field :create_post, mutation: Mutations::AddPost
  end
end
