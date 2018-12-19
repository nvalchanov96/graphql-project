require "rails_helper"

RSpec.describe Mutations::CreatePost do
  def perform(args = {})
    Mutations::CreatePost.new(object: nil, context: nil).resolve(args)
  end

  before do
    User.create
  end

  it 'creates new post' do
    result = perform(text: 'Hello World!')

    expect(result[:post].text).to eq 'Hello World!'
    expect(Post.count).to eq 1
  end

  it 'throws a validation error' do
    result = perform(text: '')

    expect(result.message).to eq "Text can't be blank"
  end
end