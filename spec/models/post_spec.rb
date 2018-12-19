require "rails_helper"

RSpec.describe Post, :type => :model do
  before do
    @user = User.create
  end

  it 'creates post successfully' do
    post = @user.posts.create(text: 'Hello World')

    expect(post).to_not be_nil
    expect(Post.count).to eq 1
    expect(post.text).to eq 'Hello World'
  end

  it "fails to create post without text" do
    post = @user.posts.create

    expect(Post.count).to eq 0
    expect(post.errors.full_messages).to eq ["Text can't be blank"]
  end
end