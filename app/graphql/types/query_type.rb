module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :users, [Types::UserType], null: true

    field :posts, [Types::PostType], null: false

    def posts
      Post.all
    end

    def users
      User.all
    end
  end
end
