module Mutations
  class CreatePost < Mutations::BaseMutation
    null true

    argument :text, String, required: true

    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    def resolve(text:)
      user = User.first
      post = user.posts.build(text: text)

      if post.save
        {
          post: post,
          errors: [],
        }
      else
         GraphQL::ExecutionError.new(post.errors.full_messages.join(", "))
      end
    end
  end
end