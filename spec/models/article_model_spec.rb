require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'creation' do
    before do
      @editor_user = FactoryGirl.create(:editor_user)
      @article = Article.create!(title: "Cars My test", content: "Test 123 123", category: "Cars", user_id: @editor_user.id)
    end

    it 'can be created' do
      expect(@article).to be_valid
    end

    it 'cannot be created without a title, content, and category' do
      @article.title, @article.content, @article.category = nil
      expect(@article).to_not be_valid
    end
  end
end
