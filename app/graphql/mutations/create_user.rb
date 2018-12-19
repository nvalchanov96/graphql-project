module Mutations
  class CreateUser < Mutations::BaseMutation
    null true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve
      user = User.create
      if user.save
        {
          user: user,
          errors: [],
        }
      else
         GraphQL::ExecutionError.new(user.errors.full_messages.join(", "))
      end
    end
  end
end