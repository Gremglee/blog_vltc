module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    object_class Types::BaseObject
    # field_class Types::BaseField
    # input_object_class Types::BaseInputObject
  end
end
