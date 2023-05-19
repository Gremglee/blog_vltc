module Types
  class Comment < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :author, Types::Author, null: false
    field :post, Types::Post, null: false
  end
end
