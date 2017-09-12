require 'rails_helper'

describe 'navigate articles' do

  describe 'index page' do
    it 'can be reached by anyone' do
      visit articles_path
      expect(page.status_code).to eq(200)
    end
  end

  describe 'show page' do
    before do
      @user = FactoryGirl.create(:user)
      @editor_user = FactoryGirl.create(:editor_user)
      login_as(@user, :scope => :user)
      @article = Article.create!(title: "Cars My test", content: "Test 123 123", category: "Cars", user_id: @editor_user.id)
    end

    it 'can be reached by a logged in user' do
      visit article_path(@article)
      expect(page.status_code).to eq(200)
    end

    it 'cannot be reached by a non user' do
      logout(@user)
      visit article_path(@article)
      expect(page).to_not have_content(/Title: Cars My Test/)
    end
  end

  describe 'Edit' do
    before do
      @editor_user = FactoryGirl.create(:editor_user)
      login_as(@editor_user, :scope => :user)
      @article = Article.create!(title: "Cars My test", content: "Test 123 123", category: "Cars", user_id: @editor_user.id)
    end

    it 'can be edited by its owner' do
      visit edit_article_path(@article)
      fill_in 'article[title]', with: "My New Title"
      fill_in 'article[content]', with: "I have been changed!!"
      # select("Cars", :from => "article[category]")
      # fill_in 'article[category]', with: "Cars"
      click_on "Update Article"

      expect(page).to have_content(/I have been changed!!/)
    end
  end
end
