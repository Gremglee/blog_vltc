require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:subject) { described_class.new(title: 'Test Post', content: 'Test Content', author: author) }
  let(:author) { build(:user, name: 'John Doe') }

  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:comments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
  end
end
