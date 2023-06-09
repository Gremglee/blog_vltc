module Types
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)

    include Pundit::Authorization

    def current_user
      context[:current_user]
    end
  end
end
