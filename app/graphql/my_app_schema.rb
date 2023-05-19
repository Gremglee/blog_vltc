class MyAppSchema < GraphQL::Schema
  query Types::Query
  mutation Types::Mutation
  use GraphQL::Batch
end
