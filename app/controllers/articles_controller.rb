require 'kramdown'

class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show, :update, :destroy]
# set_article + before action permettent de remplacer la recherche de l'article
# par son id dans les méthodes edit, show, update et destroy.

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def new
    @article = Article.new
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def show
    # @article = Article.find(params[:id])
    @show = Kramdown::Document.new(@article.content).to_html
  end

  def update
    # @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
