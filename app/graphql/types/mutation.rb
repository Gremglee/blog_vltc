module Types
  class Mutation < GraphQL::Schema::Object
    field :create_post, mutation: Mutations::AddPost
  end
end
