module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    object_class Types::BaseObject

    include Pundit::Authorization

    # field_class Types::BaseField
    # input_object_class Types::BaseInputObject
    def current_user
      context[:current_user]
    end
  end
end
