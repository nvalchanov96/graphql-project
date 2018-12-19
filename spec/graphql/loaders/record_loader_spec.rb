require "rails_helper"

RSpec.describe Loaders::RecordLoader do
  before do
    @user = User.create
    @post = @user.posts.create(text: 'Hello World!')
  end

  it 'loads the text of the post' do
    text = GraphQL::Batch.batch do
      Loaders::RecordLoader.for(Post).load(@post.id).then(&:text)
    end

    expect(text).to eq 'Hello World!'
  end

  it 'loads the user of the post' do
    user = GraphQL::Batch.batch do
      Loaders::RecordLoader.for(User).load(@post.user_id)
    end

    expect(user).to_not be_nil
  end
end