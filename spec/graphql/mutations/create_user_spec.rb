require "rails_helper"

RSpec.describe Mutations::CreateUser do
  def perform
    Mutations::CreateUser.new(object: nil, context: nil).resolve
  end

  it 'creates new user' do
    perform

    expect(User.count).to eq 1
  end
end