require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations for the comment model' do
    before(:each) do
      @comment = Comment.new(author_id: 1, post_id: 1, text: 'This is a comment')
    end

    before{@comment}
    it 'title is required' do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end

    it 'author_id is required' do
      @comment.author_id = nil
      expect(@comment).to_not be_valid
    end

    it 'post_id is required' do
      @comment.post_id = nil
      expect(@comment).to_not be_valid
    end

    it 'text is required' do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end

    it 'author_id should be an integer' do
      @comment.author_id = 'string'
      expect(@comment).to_not be_valid
    end

    it 'post_id should be an integer' do
      @comment.post_id = 'string'
      expect(@comment).to_not be_valid
    end
  end
end
