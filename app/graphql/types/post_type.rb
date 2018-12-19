module Types
  class PostType < Types::BaseObject
    graphql_name 'PostType'

    field :id, ID, null: false
    field :text, String, null: false
    field :user, Types::UserType, null: false

    def user
      Loaders::RecordLoader.for(User).load(object.user_id)
    end
  end
end