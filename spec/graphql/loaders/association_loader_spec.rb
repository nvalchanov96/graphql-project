require "rails_helper"

RSpec.describe Loaders::AssociationLoader do
  before do
    @user = User.create
    @user.posts.create(text: 'Hello World!')
    @user.posts.create(text: 'Hello from another World!')
  end

  it 'loads all posts of the user' do
    posts = GraphQL::Batch.batch do
      Loaders::AssociationLoader.for(:posts).load(@user)
    end

    expect(posts.count).to eq 2
  end
end