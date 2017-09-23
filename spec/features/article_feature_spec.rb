require 'rails_helper'
require 'byebug'

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

  describe 'Create' do
    before do
      @editor_user = FactoryGirl.create(:editor_user)
      login_as(@editor_user, :scope => :user)
    end

    it 'can be created by an owner' do
      visit new_article_path
      fill_in 'article[title]', with: "My New Title 2"
      fill_in 'article[content]', with: "I have been created?????????"
      select "Cars", :from => "article[category]"
      click_on "Create Article"
      expect(page).to have_content("I have been created?????????")
    end
  end

  describe 'Edit' do
    before do
      @editor_user = FactoryGirl.create(:editor_user)
      @editor_user_2 = FactoryGirl.create(:editor_user_2)
      login_as(@editor_user, :scope => :user)
      @article = Article.create!(title: "Cars My test", content: "Test 123 123", category: "Cars", user_id: @editor_user.id)
    end

    it 'can be edited by its owner' do
      visit edit_article_path(@article)
      fill_in 'article[title]', with: "My New Title"
      fill_in 'article[content]', with: "I have been changed!!"
      select "Cars", :from => "article[category]"
      click_on "Update Article"
      expect(page).to have_content(/I have been changed!!/)
    end

    # it 'cannot be edited by a differnt editor' do
    #   logout(@editor_user)
    #   login_as(@editor_user_2, :scope => :user)
    #   visit edit_article_path(@article)
    #   expect{ response }.to raise_exception(ActiveRecord::RecordNotFound)
    # end
  end

  describe 'delete' do
    before do
      @editor_user = FactoryGirl.create(:editor_user)
      login_as(@editor_user, :scope => :user)
      @article = Article.create!(title: "Cars My test", content: "Test 123 123", category: "Cars", user_id: @editor_user.id)
    end

    it 'can be deleted by editor_user' do
      visit articles_path
      click_on "article-#{@article.id}-delete"

      expect(page).to_not have_content("article-#{@article.id}-delete")
    end
  end
end
