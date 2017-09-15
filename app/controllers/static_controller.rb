class StaticController < ApplicationController
  def index
    @car_articles = article_limit_three "Cars"
    @ruby_articles = article_limit_three "Ruby"
    @game_articles = article_limit_three "Games"
  end

  private
    def article_limit_three topic
      Article.where(category: "#{topic}").limit(3)
    end
end
