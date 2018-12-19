require "rails_helper"

RSpec.describe User, :type => :model do
  it 'creates user with posts' do
    user = User.create
    post1 = user.posts.create(text: 'Hello World!')
    post2 = user.posts.create(text: 'Hello from another World!')

    expect(user.posts.count).to eq 2
    expect(post1.text).to eq 'Hello World!'
    expect(post2.text).to eq 'Hello from another World!'
  end
end