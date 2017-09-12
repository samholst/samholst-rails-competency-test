class StaticController < ApplicationController
  def index
    @car_articles = Article.where(category: "Cars").limit(3)
    @ruby_articles = Article.where(category: "Ruby").limit(3)
    @game_articles = Article.where(category: "Games").limit(3)
  end
end
