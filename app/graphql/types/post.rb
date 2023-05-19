module Types
  class Post < Types::BaseObject
    description 'A blog post'
    field :id, ID, null: false
    field :title, String, null: false
    field :author, [Types::Author], null: false
    field :comments, [Types::Comment]
  end
end
