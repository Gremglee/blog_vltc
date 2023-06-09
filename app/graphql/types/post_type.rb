module Types
  class PostType < Types::BaseObject
    description 'A blog post'
    field :id, ID, null: false
    field :title, String, null: false
    field :content, String, null: false
    field :author, Types::AuthorType, null: false
    field :comments, [Types::CommentType]
  end
end
