require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validations for the like model' do
    before(:each) do
      @like = Like.new(author_id: 1, post_id: 1)
    end

    before{@like}

    it 'if author_id is not present, it should not be valid' do
      @like.author_id = nil
      expect(@like).to_not be_valid
    end

    it 'if post_id is not present, it should not be valid' do
      @like.post_id = nil
      expect(@like).to_not be_valid
    end
  end
end
