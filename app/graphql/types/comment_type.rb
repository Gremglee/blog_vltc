module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :author, Types::AuthorType, null: false
    field :post, Types::PostType, null: false
  end
end
