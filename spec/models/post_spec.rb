require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations for the post model' do
    before(:each) do
      @user = User.new(name: 'Tom', bio: 'I am a developer', posts_counter: 0)
      @post = Post.new(author: @user, title: 'This is a post', text: 'This is a post text', likes_counter: 0,
                       comments_counter: 0)
    end

    before { @post }

    it 'title is nil' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'max of 500 characters' do
      @post.text = 'a' * 501
      expect(@post).to_not be_valid
    end

    it 'if likes counter is integer' do
      @post.likes_counter = 5
      expect(@post).to be_valid
    end

    it 'likes_counter is less than or eq to 0' do
      @post.likes_counter = -1
      expect(@post).to_not be_valid
    end

    it 'if comments counter is integer' do
      @post.comments_counter = 5
      expect(@post).to be_valid
    end

    it 'should return less than 5 comments' do
      value = @post.recent_comments.count
      expect(value).to be < 5
    end
  end
end
