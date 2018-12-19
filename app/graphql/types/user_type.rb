module Types
  class UserType < Types::BaseObject
    graphql_name 'UserType'

    field :id, ID, null: false
    field :posts, [Types::PostType], null: false

    def posts
      Loaders::AssociationLoader.for(:posts).load(object)
    end
  end
end