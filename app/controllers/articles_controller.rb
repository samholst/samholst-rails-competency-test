class ArticlesController < ApplicationController
  before_action :is_logged_in, only: [:show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:update, :edit, :destroy]
  access all: [:index],
         user: {except: [:destroy, :new, :create, :update, :edit]},
         editor_user: :all, admin_user: {except: [:destroy, :new, :create, :update, :edit]}

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :category, :user_id)
    end

    def check_owner
      if current_user.id != @article.user_id
        redirect_to articles_path, notice: 'You are not the posts owner.'
      end
    end

    def is_logged_in
      if !user_signed_in?
        redirect_to new_user_registration_path, notice: 'Please sign up or login to view this article.'
      end
    end
end
