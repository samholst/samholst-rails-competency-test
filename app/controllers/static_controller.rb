class StaticController < ApplicationController
  def index
    @car_articles = Article.where(category: "Cars")
    @ruby_articles = Article.where(category: "Ruby")
    @game_articles = Article.where(category: "Games")
  end
end
